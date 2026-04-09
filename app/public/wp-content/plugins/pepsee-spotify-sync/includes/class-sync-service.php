<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Service {
	/**
	 * @var Pepsee_Spotify_Sync_Spotify_Client
	 */
	protected $client;

	/**
	 * @var Pepsee_Spotify_Sync_Repository
	 */
	protected $repository;

	/**
	 * @var Pepsee_Spotify_Sync_Mapper
	 */
	protected $mapper;

	/**
	 * @var Pepsee_Spotify_Sync_Logger
	 */
	protected $logger;

	public function __construct(
		Pepsee_Spotify_Sync_Spotify_Client $client,
		Pepsee_Spotify_Sync_Repository $repository,
		Pepsee_Spotify_Sync_Mapper $mapper,
		Pepsee_Spotify_Sync_Logger $logger
	) {
		$this->client     = $client;
		$this->repository = $repository;
		$this->mapper     = $mapper;
		$this->logger     = $logger;
	}

	public function run( array $args = array() ) {
		if ( function_exists( 'set_time_limit' ) ) {
			@set_time_limit( 120 );
		}

		$dry_run  = ! empty( $args['dry_run'] );
		$settings = $this->repository->get_settings();
		$window_days = ! empty( $args['sync_window_days_override'] ) ? max( 1, (int) $args['sync_window_days_override'] ) : (int) $settings['sync_window_days'];
		$followed = $this->client->get_followed_artists();
		$batch_size   = ! empty( $args['artists_per_run'] ) ? max( 1, (int) $args['artists_per_run'] ) : (int) $settings['artists_per_run'];
		$batch_page   = ! empty( $args['batch_page'] ) ? max( 1, (int) $args['batch_page'] ) : 1;
		$since_ts = strtotime( '-' . $window_days . ' days', current_time( 'timestamp' ) );
		$stats    = array(
			'dry_run'              => $dry_run,
			'started_at'           => current_time( 'mysql' ),
			'finished_at'          => '',
			'followed_artists'     => 0,
			'batch_page'           => $batch_page,
			'artists_per_run'      => $batch_size,
			'total_batches'        => 1,
			'artists_processed'    => 0,
			'source_artists_saved' => 0,
			'releases_found'       => 0,
			'releases_in_window'   => 0,
			'releases_new'         => 0,
			'releases_existing'    => 0,
			'release_preview'      => array(),
			'albums_created'       => 0,
			'albums_updated'       => 0,
			'tracks_created'       => 0,
			'tracks_updated'       => 0,
			'missing_artists'      => 0,
			'errors'               => array(),
			'include_groups'       => $settings['include_groups'],
			'sync_window_days'     => $window_days,
		);

		if ( is_wp_error( $followed ) ) {
			$stats['finished_at'] = current_time( 'mysql' );
			$stats['errors'][]    = $followed->get_error_message();
			$this->repository->set_last_run( $stats );
			$this->logger->error( 'Spotify sync aborted.', array( 'dry_run' => $dry_run, 'error' => $followed->get_error_message() ) );

			return $stats;
		}

		$stats['followed_artists'] = count( $followed );
		$stats['eligible_artists'] = $stats['followed_artists'];
		$stats['total_batches']    = max( 1, (int) ceil( $stats['followed_artists'] / $batch_size ) );

		if ( $batch_page > $stats['total_batches'] ) {
			$batch_page = $stats['total_batches'];
			$stats['batch_page'] = $batch_page;
		}

		$followed = array_slice( $followed, ( $batch_page - 1 ) * $batch_size, $batch_size );

		$this->logger->info( 'Spotify sync started.', array( 'dry_run' => $dry_run, 'followed_artists_total' => $stats['followed_artists'], 'batch_page' => $batch_page, 'artists_per_run' => $batch_size, 'artists_in_batch' => count( $followed ) ) );

		if ( $dry_run ) {
			$stats = $this->run_dry_scan( $followed, $settings, $since_ts, $stats );
		} else {
			$stats = $this->run_full_sync( $followed, $settings, $since_ts, $stats );
		}

		$stats['finished_at'] = current_time( 'mysql' );
		$this->repository->set_last_run( $stats );
		$this->logger->info(
			'Spotify sync finished.',
			array(
				'dry_run'              => $dry_run,
				'followed_artists'     => $stats['followed_artists'],
				'batch_page'           => $stats['batch_page'],
				'total_batches'        => $stats['total_batches'],
				'artists'              => $stats['artists_processed'],
				'releases_found'       => $stats['releases_found'],
				'releases_in_window'   => $stats['releases_in_window'],
				'source_artists_saved' => $stats['source_artists_saved'],
				'albums_created'       => $stats['albums_created'],
				'tracks_created'       => $stats['tracks_created'],
				'errors'               => count( $stats['errors'] ),
			)
		);

		return $stats;
	}

	public function import_release_ids( array $release_ids, array $args = array() ) {
		if ( function_exists( 'set_time_limit' ) ) {
			@set_time_limit( 120 );
		}

		$release_ids = array_values( array_unique( array_filter( array_map( 'sanitize_text_field', $release_ids ) ) ) );
		$stats       = array(
			'dry_run'              => false,
			'started_at'           => current_time( 'mysql' ),
			'finished_at'          => '',
			'import_mode'          => 'preview_page',
			'imported_releases'    => count( $release_ids ),
			'primary_post_id'      => 0,
			'primary_post_type'    => '',
			'primary_album_id'     => 0,
			'imported_album_ids'   => array(),
			'imported_track_ids'   => array(),
			'albums_created'       => 0,
			'albums_updated'       => 0,
			'tracks_created'       => 0,
			'tracks_updated'       => 0,
			'source_artists_saved' => 0,
			'missing_artists'      => 0,
			'errors'               => array(),
		);

		foreach ( $release_ids as $release_id ) {
			$album = $this->client->request( 'GET', sprintf( 'albums/%s', rawurlencode( $release_id ) ), array( 'market' => 'FR' ) );

			if ( is_wp_error( $album ) ) {
				$stats['errors'][] = sprintf( 'Album %s: %s', $release_id, $album->get_error_message() );
				continue;
			}

			$is_single_release = ! empty( $album['album_type'] ) && 'single' === $album['album_type'];

			if ( $is_single_release ) {
				$track_post_ids = $this->sync_tracks_from_album_data( $album, 0, false, $stats );

				if ( ! empty( $track_post_ids ) ) {
					$stats['imported_track_ids'] = array_merge( $stats['imported_track_ids'], $track_post_ids );

					if ( empty( $stats['primary_post_id'] ) ) {
						$stats['primary_post_id']   = (int) reset( $track_post_ids );
						$stats['primary_post_type'] = 'music';
					}
				}

				continue;
			}

			$album_id = $this->sync_album_data( $album, false, $stats );

			if ( ! $album_id ) {
				continue;
			}

			if ( empty( $stats['primary_album_id'] ) ) {
				$stats['primary_album_id'] = (int) $album_id;
			}

			if ( empty( $stats['primary_post_id'] ) ) {
				$stats['primary_post_id']   = (int) $album_id;
				$stats['primary_post_type'] = 'album';
			}

			$stats['imported_album_ids'][] = (int) $album_id;
		}

		$stats['imported_album_ids'] = array_values( array_unique( array_map( 'intval', $stats['imported_album_ids'] ) ) );
		$stats['imported_track_ids'] = array_values( array_unique( array_map( 'intval', $stats['imported_track_ids'] ) ) );

		$stats['finished_at'] = current_time( 'mysql' );
		$this->repository->set_last_run( $stats );
		$this->logger->info(
			'Spotify preview import finished.',
			array(
				'imported_releases' => $stats['imported_releases'],
				'albums_created'    => $stats['albums_created'],
				'tracks_created'    => $stats['tracks_created'],
				'errors'            => count( $stats['errors'] ),
			)
		);

		return $stats;
	}

	public function import_single_release( $release_id ) {
		$release_id = sanitize_text_field( (string) $release_id );

		if ( '' === $release_id ) {
			return new WP_Error( 'spotify_missing_release_id', __( 'Release Spotify manquante.', 'pepsee-spotify-sync' ) );
		}

		return $this->import_release_ids( array( $release_id ) );
	}

	public function get_release_details( $release_id ) {
		$release_id = sanitize_text_field( (string) $release_id );

		if ( '' === $release_id ) {
			return new WP_Error( 'spotify_missing_release_id', __( 'Release Spotify manquante.', 'pepsee-spotify-sync' ) );
		}

		return $this->client->request( 'GET', sprintf( 'albums/%s', rawurlencode( $release_id ) ), array( 'market' => 'FR' ) );
	}

	public function get_release_target_post_type( array $release ) {
		return ( ! empty( $release['album_type'] ) && 'single' === $release['album_type'] ) ? 'music' : 'album';
	}

	public function merge_release_into_existing_post( $release_id, $post_id ) {
		$release = $this->get_release_details( $release_id );

		if ( is_wp_error( $release ) ) {
			return $release;
		}

		$post_id   = (int) $post_id;
		$post      = get_post( $post_id );
		$post_type = $this->get_release_target_post_type( $release );

		if ( ! $post ) {
			return new WP_Error( 'spotify_missing_target_post', __( 'Post cible introuvable.', 'pepsee-spotify-sync' ) );
		}

		if ( 'music' !== $post_type ) {
			return new WP_Error( 'spotify_merge_supported_only_for_singles', __( 'Le complément d’un post existant est disponible uniquement pour les singles.', 'pepsee-spotify-sync' ) );
		}

		if ( $post_type !== $post->post_type ) {
			return new WP_Error( 'spotify_invalid_target_post_type', __( 'Le type du post cible ne correspond pas à cette release Spotify.', 'pepsee-spotify-sync' ) );
		}

		if ( 'music' === $post_type ) {
			return $this->merge_single_release_into_music_post( $post_id, $release );
		}

		return $this->merge_album_release_into_album_post( $post_id, $release );
	}

	public function scan_followed_artists_chunk( array $followed, array $settings = array(), array $carry = array() ) {
		$settings    = wp_parse_args(
			$settings,
			array(
				'include_groups'   => array( 'album', 'single', 'appears_on', 'compilation' ),
				'sync_window_days' => 7,
			)
		);
		$window_days = max( 1, (int) $settings['sync_window_days'] );
		$since_ts    = strtotime( '-' . $window_days . ' days', current_time( 'timestamp' ) );
		$stats       = wp_parse_args(
			$carry,
			array(
				'dry_run'            => true,
				'started_at'         => current_time( 'mysql' ),
				'finished_at'        => '',
				'followed_artists'   => 0,
				'artists_processed'  => 0,
				'releases_found'     => 0,
				'releases_in_window' => 0,
				'releases_new'       => 0,
				'releases_existing'  => 0,
				'releases_seen'      => 0,
				'release_preview'    => array(),
				'errors'             => array(),
				'sync_window_days'   => $window_days,
				'_seen_release_ids'  => array(),
			)
		);

		foreach ( $followed as $spotify_artist ) {
			$spotify_id = isset( $spotify_artist['id'] ) ? sanitize_text_field( $spotify_artist['id'] ) : '';

			if ( '' === $spotify_id ) {
				continue;
			}

			$stats['artists_processed']++;
			$releases = $this->fetch_artist_releases( $spotify_id, (array) $settings['include_groups'] );

			if ( is_wp_error( $releases ) ) {
				$stats['errors'][] = sprintf( 'Artist %s: %s', $spotify_id, $releases->get_error_message() );
				continue;
			}

			$stats['releases_found'] += count( $releases );

			foreach ( $releases as $release ) {
				if ( empty( $release['id'] ) || ! $this->is_release_in_window( $release, $since_ts ) ) {
					continue;
				}

				if ( isset( $stats['_seen_release_ids'][ $release['id'] ] ) ) {
					continue;
				}

				$stats['_seen_release_ids'][ $release['id'] ] = true;
				$stats['releases_in_window']++;
				$existing_album_id = $this->repository->find_post_by_spotify_meta( 'album', '_spotify_album_id', $release['id'] );
				$seen_before       = $this->repository->has_seen_release_id( $release['id'] );

				if ( $existing_album_id ) {
					$stats['releases_existing']++;
				} elseif ( $seen_before ) {
					$stats['releases_seen']++;
				} else {
					$stats['releases_new']++;
				}

					$stats['release_preview'][] = array(
						'id'           => sanitize_text_field( $release['id'] ),
						'name'         => isset( $release['name'] ) ? sanitize_text_field( $release['name'] ) : '',
						'release_date' => isset( $release['release_date'] ) ? sanitize_text_field( $release['release_date'] ) : '',
						'album_type'   => isset( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '',
						'album_group'  => isset( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '',
						'artist_name'  => isset( $spotify_artist['name'] ) ? sanitize_text_field( $spotify_artist['name'] ) : '',
						'spotify_url'  => ! empty( $release['external_urls']['spotify'] ) ? esc_url_raw( $release['external_urls']['spotify'] ) : '',
						'image_url'    => $this->extract_release_image( $release ),
						'is_new'       => ( ! $existing_album_id && ! $seen_before ) ? 1 : 0,
						'in_wp'        => $existing_album_id ? 1 : 0,
						'seen_before'  => $seen_before ? 1 : 0,
					);
			}
		}

		if ( ! empty( $stats['_seen_release_ids'] ) ) {
			$this->repository->mark_release_ids_seen( array_keys( $stats['_seen_release_ids'] ) );
		}

		usort(
			$stats['release_preview'],
			function( $left, $right ) {
				$left_new  = ! empty( $left['is_new'] ) ? 1 : 0;
				$right_new = ! empty( $right['is_new'] ) ? 1 : 0;

				if ( $left_new !== $right_new ) {
					return $right_new <=> $left_new;
				}

				$left_date  = ! empty( $left['release_date'] ) ? strtotime( $left['release_date'] . ' 00:00:00' ) : 0;
				$right_date = ! empty( $right['release_date'] ) ? strtotime( $right['release_date'] . ' 00:00:00' ) : 0;

				if ( $left_date !== $right_date ) {
					return $right_date <=> $left_date;
				}

				return strcmp(
					isset( $left['name'] ) ? (string) $left['name'] : '',
					isset( $right['name'] ) ? (string) $right['name'] : ''
				);
			}
		);

		return $stats;
	}

	protected function run_dry_scan( array $followed, array $settings, $since_ts, array $stats ) {
		$seen_release_ids = array();

		foreach ( $followed as $spotify_artist ) {
			$spotify_id = isset( $spotify_artist['id'] ) ? sanitize_text_field( $spotify_artist['id'] ) : '';

			if ( '' === $spotify_id ) {
				continue;
			}

			$stats['artists_processed']++;
			$releases = $this->fetch_artist_releases( $spotify_id, $settings['include_groups'] );

			if ( is_wp_error( $releases ) ) {
				$stats['errors'][] = sprintf( 'Artist %s: %s', $spotify_id, $releases->get_error_message() );
				continue;
			}

			$stats['releases_found'] += count( $releases );

			foreach ( $releases as $release ) {
				if ( empty( $release['id'] ) ) {
					continue;
				}

				if ( ! $this->is_release_in_window( $release, $since_ts ) ) {
					continue;
				}

				if ( isset( $seen_release_ids[ $release['id'] ] ) ) {
					continue;
				}

				$seen_release_ids[ $release['id'] ] = true;
				$existing_album_id = $this->repository->find_post_by_spotify_meta( 'album', '_spotify_album_id', $release['id'] );
				$seen_before       = $this->repository->has_seen_release_id( $release['id'] );

				if ( $existing_album_id ) {
					$stats['releases_existing']++;
				} elseif ( $seen_before ) {
					$stats['releases_seen'] = isset( $stats['releases_seen'] ) ? (int) $stats['releases_seen'] + 1 : 1;
				} else {
					$stats['releases_new']++;
				}

					$stats['release_preview'][] = array(
						'id'           => sanitize_text_field( $release['id'] ),
						'name'         => isset( $release['name'] ) ? sanitize_text_field( $release['name'] ) : '',
						'release_date' => isset( $release['release_date'] ) ? sanitize_text_field( $release['release_date'] ) : '',
						'album_type'   => isset( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '',
						'album_group'  => isset( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '',
						'artist_name'  => isset( $spotify_artist['name'] ) ? sanitize_text_field( $spotify_artist['name'] ) : '',
						'spotify_url'  => ! empty( $release['external_urls']['spotify'] ) ? esc_url_raw( $release['external_urls']['spotify'] ) : '',
						'image_url'    => $this->extract_release_image( $release ),
						'is_new'       => ( ! $existing_album_id && ! $seen_before ) ? 1 : 0,
						'in_wp'        => $existing_album_id ? 1 : 0,
						'seen_before'  => $seen_before ? 1 : 0,
					);
			}
		}

		$stats['releases_in_window'] = count( $seen_release_ids );
		if ( ! empty( $seen_release_ids ) ) {
			$this->repository->mark_release_ids_seen( array_keys( $seen_release_ids ) );
		}

		return $stats;
	}

	protected function extract_release_image( array $release ) {
		if ( ! empty( $release['images'] ) && is_array( $release['images'] ) ) {
			foreach ( $release['images'] as $image ) {
				if ( ! empty( $image['url'] ) ) {
					return esc_url_raw( $image['url'] );
				}
			}
		}

		if ( ! empty( $release['album']['images'] ) && is_array( $release['album']['images'] ) ) {
			foreach ( $release['album']['images'] as $image ) {
				if ( ! empty( $image['url'] ) ) {
					return esc_url_raw( $image['url'] );
				}
			}
		}

		return '';
	}

	protected function run_full_sync( array $followed, array $settings, $since_ts, array $stats ) {
		$seen_release_ids = array();

		foreach ( $followed as $spotify_artist ) {
			$spotify_id = isset( $spotify_artist['id'] ) ? sanitize_text_field( $spotify_artist['id'] ) : '';

			if ( '' === $spotify_id ) {
				continue;
			}

			$stats['artists_processed']++;
			$existing_artist_id = $this->repository->find_artist_post_by_spotify_id( $spotify_id );

			if ( ! $existing_artist_id ) {
				$created_artist_id = $this->repository->get_or_create_artist_from_spotify( $spotify_artist, false );

				if ( $created_artist_id ) {
					$stats['source_artists_saved']++;
				}
			}

			$releases = $this->fetch_artist_releases( $spotify_id, $settings['include_groups'] );

			if ( is_wp_error( $releases ) ) {
				$stats['errors'][] = sprintf( 'Artist %s: %s', $spotify_id, $releases->get_error_message() );
				continue;
			}

			$stats['releases_found'] += count( $releases );

			foreach ( $releases as $release ) {
				if ( empty( $release['id'] ) ) {
					continue;
				}

				if ( ! $this->is_release_in_window( $release, $since_ts ) ) {
					continue;
				}

				$seen_release_ids[ $release['id'] ] = true;
				$album_id = $this->sync_album( $release, false, $stats );

				if ( ! $album_id ) {
					continue;
				}

				$this->sync_tracks_for_album( $release['id'], $album_id, false, $stats );
			}
		}

		$stats['releases_in_window'] = count( $seen_release_ids );

		return $stats;
	}

	protected function fetch_artist_releases( $spotify_artist_id, array $include_groups ) {
		$cached = $this->repository->get_cached_artist_releases( $spotify_artist_id, $include_groups );

		if ( is_array( $cached ) ) {
			return $cached;
		}

		$results = array();
		$offset  = 0;
		$limit   = 50;

		do {
			$response = $this->client->request(
				'GET',
				sprintf( 'artists/%s/albums', rawurlencode( $spotify_artist_id ) ),
				array(
					'include_groups' => implode( ',', $include_groups ),
					'limit'          => $limit,
					'offset'         => $offset,
					'market'         => 'FR',
				)
			);

			if ( is_wp_error( $response ) ) {
				return $response;
			}

			$items = ! empty( $response['items'] ) ? (array) $response['items'] : array();
			$results = array_merge( $results, $items );
			$offset += $limit;
			$has_more = ! empty( $response['next'] );
		} while ( $has_more );

		$unique = array();

		foreach ( $results as $release ) {
			if ( empty( $release['id'] ) ) {
				continue;
			}

			if ( ! $this->should_include_release( $release, $include_groups ) ) {
				continue;
			}

			$unique[ $release['id'] ] = $release;
		}

		$unique = array_values( $unique );
		$this->repository->set_cached_artist_releases( $spotify_artist_id, $include_groups, $unique );

		return $unique;
	}

	protected function should_include_release( array $release, array $include_groups ) {
		$include_groups = array_values( array_filter( array_map( 'sanitize_key', $include_groups ) ) );
		$album_group    = ! empty( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '';
		$album_type     = ! empty( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '';

		if ( $album_group && ! in_array( $album_group, $include_groups, true ) ) {
			return false;
		}

		if ( 'compilation' === $album_type && ! in_array( 'compilation', $include_groups, true ) ) {
			return false;
		}

		return true;
	}

	protected function sync_album( array $release, $dry_run, array &$stats ) {
		$album = $this->client->request( 'GET', sprintf( 'albums/%s', rawurlencode( $release['id'] ) ), array( 'market' => 'FR' ) );

		if ( is_wp_error( $album ) ) {
			$stats['errors'][] = sprintf( 'Album %s: %s', $release['id'], $album->get_error_message() );
			return 0;
		}

		return $this->sync_album_data( $album, $dry_run, $stats );
	}

	protected function sync_album_data( array $album, $dry_run, array &$stats ) {
		if ( empty( $album['id'] ) ) {
			return 0;
		}

		$artist_ids = $this->resolve_existing_artist_ids( isset( $album['artists'] ) ? (array) $album['artists'] : array() );
		$existing   = $this->repository->find_post_by_spotify_meta( 'album', '_spotify_album_id', $album['id'] );
		$mapped     = $this->mapper->map_album( $album, $artist_ids, $existing );

		$mapped['meta']['_spotify_artist_genres'] = $this->collect_artist_genres( $album );
		$album_id = $this->mapper->sync_mapped_post( 'album', $mapped, $dry_run );

		if ( $existing ) {
			$stats['albums_updated']++;
		} else {
			$stats['albums_created']++;
		}

		if ( ! $dry_run && $album_id ) {
			$this->repository->sideload_featured_image(
				$this->mapper->extract_primary_image( $album ),
				$album_id,
				isset( $album['name'] ) ? $album['name'] : '',
				$this->build_image_filename_base(
					isset( $album['name'] ) ? $album['name'] : '',
					isset( $album['artists'] ) ? (array) $album['artists'] : array()
				)
			);
			$this->repository->sync_artist_genres( $album_id, $mapped['meta']['_spotify_artist_genres'] );
		}

		return $album_id;
	}

	protected function sync_tracks_for_album( $spotify_album_id, $album_post_id, $dry_run, array &$stats ) {
		$album = $this->client->request( 'GET', sprintf( 'albums/%s', rawurlencode( $spotify_album_id ) ), array( 'market' => 'FR' ) );

		if ( is_wp_error( $album ) ) {
			$stats['errors'][] = sprintf( 'Tracks %s: %s', $spotify_album_id, $album->get_error_message() );
			return array();
		}

		return $this->sync_tracks_from_album_data( $album, $album_post_id, $dry_run, $stats );
	}

	protected function sync_tracks_from_album_data( array $album, $album_post_id, $dry_run, array &$stats ) {
		$created_track_ids = array();
		$track_ids = array();

		if ( ! empty( $album['tracks']['items'] ) && is_array( $album['tracks']['items'] ) ) {
			foreach ( $album['tracks']['items'] as $track ) {
				if ( ! empty( $track['id'] ) ) {
					$track_ids[] = $track['id'];
				}
			}
		}

		$audio_features_index = $this->fetch_audio_features_map( $track_ids );

		if ( empty( $album['tracks']['items'] ) || ! is_array( $album['tracks']['items'] ) ) {
			return $created_track_ids;
		}

		foreach ( $album['tracks']['items'] as $track ) {
			$track['album'] = $album;

			$artist_ids = $this->resolve_existing_artist_ids( isset( $track['artists'] ) ? (array) $track['artists'] : array() );
			$existing   = $this->repository->find_post_by_spotify_meta( 'music', '_spotify_track_id', $track['id'] );
			$mapped     = $this->mapper->map_track(
				$track,
				$album_post_id,
				$artist_ids,
				isset( $audio_features_index[ $track['id'] ] ) ? $audio_features_index[ $track['id'] ] : array(),
				$existing
			);

			$track_id = $this->mapper->sync_mapped_post( 'music', $mapped, $dry_run );

			if ( $existing ) {
				$stats['tracks_updated']++;
			} else {
				$stats['tracks_created']++;
			}

			if ( ! $dry_run && $track_id ) {
				$this->repository->sideload_featured_image(
					$this->mapper->extract_primary_image( $album ),
					$track_id,
					isset( $track['name'] ) ? $track['name'] : '',
					$this->build_image_filename_base(
						isset( $track['name'] ) ? $track['name'] : '',
						isset( $track['artists'] ) ? (array) $track['artists'] : array()
					)
				);
				$this->repository->sync_artist_genres( $track_id, $this->collect_artist_genres( $album ) );
			}

			if ( $track_id ) {
				$created_track_ids[] = (int) $track_id;
			}
		}

		return array_values( array_unique( $created_track_ids ) );
	}

	protected function fetch_audio_features_map( array $track_ids ) {
		$track_ids = array_values( array_filter( array_map( 'sanitize_text_field', $track_ids ) ) );

		if ( empty( $track_ids ) ) {
			return array();
		}

		$response = $this->client->request(
			'GET',
			'audio-features',
			array(
				'ids' => implode( ',', $track_ids ),
			)
		);

		if ( is_wp_error( $response ) || empty( $response['audio_features'] ) ) {
			return array();
		}

		$index = array();

		foreach ( (array) $response['audio_features'] as $item ) {
			if ( ! empty( $item['id'] ) ) {
				$index[ $item['id'] ] = $item;
			}
		}

		return $index;
	}

	protected function resolve_artist_ids( array $spotify_artists, $dry_run, array &$stats ) {
		$ids = array();

		foreach ( $spotify_artists as $spotify_artist ) {
			$artist_id = $this->repository->get_or_create_artist_from_spotify( $spotify_artist, $dry_run );

			if ( ! $artist_id ) {
				$stats['missing_artists']++;
				continue;
			}

			$ids[] = $artist_id;
		}

		return array_values( array_unique( array_filter( array_map( 'intval', $ids ) ) ) );
	}

	protected function resolve_existing_artist_ids( array $spotify_artists ) {
		$ids = array();

		foreach ( $spotify_artists as $spotify_artist ) {
			if ( empty( $spotify_artist['id'] ) ) {
				continue;
			}

			$artist_id = $this->repository->find_artist_post_by_spotify_id( $spotify_artist['id'] );

			if ( $artist_id ) {
				$ids[] = (int) $artist_id;
			}
		}

		return array_values( array_unique( array_filter( $ids ) ) );
	}

	protected function build_image_filename_base( $name, array $artists ) {
		$name         = sanitize_text_field( (string) $name );
		$artist_names = array();

		foreach ( $artists as $artist ) {
			if ( ! empty( $artist['name'] ) ) {
				$artist_names[] = sanitize_text_field( $artist['name'] );
			}
		}

		$parts = array_filter(
			array(
				$name,
				implode( ' ', $artist_names ),
			)
		);

		return trim( implode( ' ', $parts ) );
	}

	protected function merge_album_release_into_album_post( $post_id, array $release ) {
		$spotify_url = ! empty( $release['external_urls']['spotify'] ) ? esc_url_raw( $release['external_urls']['spotify'] ) : '';

		$this->repository->maybe_set_field_value( 'spotify', $spotify_url, $post_id, false );
		$this->repository->update_spotify_meta(
			$post_id,
			array(
				'_spotify_album_id'    => ! empty( $release['id'] ) ? sanitize_text_field( $release['id'] ) : '',
				'_spotify_album_uri'   => ! empty( $release['uri'] ) ? sanitize_text_field( $release['uri'] ) : '',
				'_spotify_album_type'  => ! empty( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '',
				'_spotify_album_group' => ! empty( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '',
				'_spotify_image_url'   => $this->mapper->extract_primary_image( $release ),
			)
		);

		$this->repository->sideload_featured_image(
			$this->mapper->extract_primary_image( $release ),
			$post_id,
			isset( $release['name'] ) ? $release['name'] : '',
			$this->build_image_filename_base(
				isset( $release['name'] ) ? $release['name'] : '',
				isset( $release['artists'] ) ? (array) $release['artists'] : array()
			),
			true
		);

		return array(
			'post_id'   => $post_id,
			'post_type' => 'album',
		);
	}

	protected function merge_single_release_into_music_post( $post_id, array $release ) {
		$track_id    = 0;
		$track_meta  = array();
		$spotify_url = ! empty( $release['external_urls']['spotify'] ) ? esc_url_raw( $release['external_urls']['spotify'] ) : '';

		if ( ! empty( $release['tracks']['items'][0]['id'] ) ) {
			$track_id = sanitize_text_field( $release['tracks']['items'][0]['id'] );
			$track    = $this->client->request( 'GET', sprintf( 'tracks/%s', rawurlencode( $track_id ) ), array( 'market' => 'FR' ) );

			if ( ! is_wp_error( $track ) ) {
				$spotify_url = ! empty( $track['external_urls']['spotify'] ) ? esc_url_raw( $track['external_urls']['spotify'] ) : $spotify_url;
				$track_meta  = array(
					'_spotify_track_id'     => ! empty( $track['id'] ) ? sanitize_text_field( $track['id'] ) : '',
					'_spotify_track_uri'    => ! empty( $track['uri'] ) ? sanitize_text_field( $track['uri'] ) : '',
					'_spotify_track_number' => isset( $track['track_number'] ) ? (int) $track['track_number'] : 0,
					'_spotify_disc_number'  => isset( $track['disc_number'] ) ? (int) $track['disc_number'] : 0,
					'_spotify_duration_ms'  => isset( $track['duration_ms'] ) ? (int) $track['duration_ms'] : 0,
				);
			}
		}

		$this->repository->maybe_set_field_value( 'spotify', $spotify_url, $post_id, false );
		$this->repository->update_spotify_meta(
			$post_id,
			array_merge(
				array(
					'_spotify_album_id'    => ! empty( $release['id'] ) ? sanitize_text_field( $release['id'] ) : '',
					'_spotify_album_uri'   => ! empty( $release['uri'] ) ? sanitize_text_field( $release['uri'] ) : '',
					'_spotify_album_type'  => ! empty( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '',
					'_spotify_album_group' => ! empty( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '',
					'_spotify_album_name'  => ! empty( $release['name'] ) ? sanitize_text_field( $release['name'] ) : '',
					'_spotify_image_url'   => $this->mapper->extract_primary_image( $release ),
				),
				$track_meta
			)
		);

		$this->repository->sideload_featured_image(
			$this->mapper->extract_primary_image( $release ),
			$post_id,
			isset( $release['name'] ) ? $release['name'] : '',
			$this->build_image_filename_base(
				isset( $release['name'] ) ? $release['name'] : '',
				isset( $release['artists'] ) ? (array) $release['artists'] : array()
			)
		);

		return array(
			'post_id'   => $post_id,
			'post_type' => 'music',
		);
	}

	protected function is_release_in_window( array $release, $since_timestamp ) {
		if ( empty( $release['release_date'] ) ) {
			return false;
		}

		$precision = ! empty( $release['release_date_precision'] ) ? $release['release_date_precision'] : 'day';
		$date      = $release['release_date'];

		if ( 'year' === $precision ) {
			$date .= '-01-01';
		} elseif ( 'month' === $precision ) {
			$date .= '-01';
		}

		$release_timestamp = strtotime( $date . ' 00:00:00' );

		return $release_timestamp && $release_timestamp >= $since_timestamp;
	}

	protected function collect_artist_genres( array $album ) {
		$genres = array();

		if ( empty( $album['artists'] ) || ! is_array( $album['artists'] ) ) {
			return $genres;
		}

		foreach ( $album['artists'] as $artist ) {
			if ( empty( $artist['id'] ) ) {
				continue;
			}

			$artist_post_id = $this->repository->find_artist_post_by_spotify_id( $artist['id'] );

			if ( ! $artist_post_id ) {
				continue;
			}

			$terms = wp_get_object_terms( $artist_post_id, 'genre', array( 'fields' => 'names' ) );

			if ( ! is_wp_error( $terms ) ) {
				$genres = array_merge( $genres, $terms );
			}
		}

		return array_values( array_unique( array_filter( $genres ) ) );
	}
}
