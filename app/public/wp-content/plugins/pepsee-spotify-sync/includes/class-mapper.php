<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Mapper {
	/**
	 * @var Pepsee_Spotify_Sync_Repository
	 */
	protected $repository;

	/**
	 * @var Pepsee_Spotify_Sync_Logger
	 */
	protected $logger;

	public function __construct( Pepsee_Spotify_Sync_Repository $repository, Pepsee_Spotify_Sync_Logger $logger ) {
		$this->repository = $repository;
		$this->logger     = $logger;
	}

	public function map_album( array $release, array $artist_ids, $existing_id = 0 ) {
		$artist_names = $this->extract_artist_names( $release );
		$title        = isset( $release['name'] ) ? $this->normalize_display_text( $release['name'] ) : __( 'Album sans titre', 'pepsee-spotify-sync' );
		$spotify_url  = isset( $release['external_urls']['spotify'] ) ? esc_url_raw( $release['external_urls']['spotify'] ) : '';
		$post_date    = ! empty( $release['release_date'] ) ? $this->normalize_release_date( $release['release_date'], $release['release_date_precision'] ) : current_time( 'mysql' );

		$postarr = array(
			'ID'            => $existing_id,
			'post_title'    => $existing_id ? get_post_field( 'post_title', $existing_id ) : $title,
			'post_date'     => $post_date,
			'post_date_gmt' => get_gmt_from_date( $post_date ),
		);

		if ( ! $existing_id && ! empty( $release['album_type'] ) && 'album' === $release['album_type'] ) {
			$postarr['post_content'] = $this->build_album_post_content( $release );
		}

		$fields = array(
			'titre'             => $title,
			'artistes'          => implode( ' x ', $artist_names ),
			'artistes_principal'=> array_values( array_filter( array_map( 'intval', $artist_ids ) ) ),
			'artistes_associes' => array(),
			'spotify'           => $spotify_url,
			'label'             => $this->normalize_label( isset( $release['label'] ) ? $release['label'] : '' ),
		);

		$meta = array(
			'_spotify_album_id'        => isset( $release['id'] ) ? sanitize_text_field( $release['id'] ) : '',
			'_spotify_album_uri'       => isset( $release['uri'] ) ? sanitize_text_field( $release['uri'] ) : '',
			'_spotify_album_type'      => isset( $release['album_type'] ) ? sanitize_key( $release['album_type'] ) : '',
			'_spotify_album_group'     => isset( $release['album_group'] ) ? sanitize_key( $release['album_group'] ) : '',
			'_spotify_total_tracks'    => isset( $release['total_tracks'] ) ? (int) $release['total_tracks'] : 0,
			'_spotify_release_date'    => isset( $release['release_date'] ) ? sanitize_text_field( $release['release_date'] ) : '',
			'_spotify_release_precise' => isset( $release['release_date_precision'] ) ? sanitize_key( $release['release_date_precision'] ) : '',
			'_spotify_image_url'       => $this->extract_primary_image( $release ),
		);

		return compact( 'postarr', 'fields', 'meta' );
	}

	public function map_track( array $track, $album_post_id, array $artist_ids, array $audio_features, $existing_id = 0 ) {
		$artist_names = $this->extract_artist_names( $track );
		$title        = isset( $track['name'] ) ? $this->normalize_display_text( $track['name'] ) : __( 'Track sans titre', 'pepsee-spotify-sync' );
		$spotify_url  = isset( $track['external_urls']['spotify'] ) ? esc_url_raw( $track['external_urls']['spotify'] ) : '';
		$album_name   = isset( $track['album']['name'] ) ? $this->normalize_display_text( $track['album']['name'] ) : '';
		$post_date    = ! empty( $track['album']['release_date'] ) ? $this->normalize_release_date( $track['album']['release_date'], $track['album']['release_date_precision'] ) : current_time( 'mysql' );

		$postarr = array(
			'ID'            => $existing_id,
			'post_title'    => $existing_id ? get_post_field( 'post_title', $existing_id ) : $title,
			'post_date'     => $post_date,
			'post_date_gmt' => get_gmt_from_date( $post_date ),
		);

		$fields = array(
			'titre'             => $title,
			'artistes'          => implode( ' x ', $artist_names ),
			'artistes_associes' => array(),
			'albums_associes'   => $album_post_id ? array( (int) $album_post_id ) : array(),
			'spotify'           => $spotify_url,
			'label'             => $this->normalize_label( isset( $track['album']['label'] ) ? $track['album']['label'] : '' ),
		);

		$meta = array(
			'_spotify_track_id'          => isset( $track['id'] ) ? sanitize_text_field( $track['id'] ) : '',
			'_spotify_track_uri'         => isset( $track['uri'] ) ? sanitize_text_field( $track['uri'] ) : '',
			'_spotify_track_number'      => isset( $track['track_number'] ) ? (int) $track['track_number'] : 0,
			'_spotify_disc_number'       => isset( $track['disc_number'] ) ? (int) $track['disc_number'] : 0,
			'_spotify_duration_ms'       => isset( $track['duration_ms'] ) ? (int) $track['duration_ms'] : 0,
			'_spotify_is_explicit'       => ! empty( $track['explicit'] ) ? '1' : '0',
			'_spotify_preview_url'       => isset( $track['preview_url'] ) ? esc_url_raw( $track['preview_url'] ) : '',
			'_spotify_album_name'        => $album_name,
			'_spotify_audio_features'    => $audio_features,
			'_spotify_audio_features_ts' => current_time( 'mysql' ),
		);

		return compact( 'postarr', 'fields', 'meta' );
	}

	public function sync_mapped_post( $post_type, array $mapped, $dry_run = false ) {
		if ( $dry_run ) {
			return isset( $mapped['postarr']['ID'] ) ? (int) $mapped['postarr']['ID'] : 0;
		}

		$post_id = $this->repository->ensure_post( $post_type, $mapped['postarr'] );

		if ( is_wp_error( $post_id ) ) {
			$this->logger->error( 'Unable to persist synced post.', array( 'post_type' => $post_type, 'error' => $post_id->get_error_message() ) );
			return 0;
		}

		$post_id = (int) $post_id;

		foreach ( $mapped['fields'] as $field_name => $value ) {
			$this->repository->maybe_set_field_value( $field_name, $value, $post_id, true );
		}

		$this->repository->update_spotify_meta( $post_id, $mapped['meta'] );

		if ( 'album' === $post_type ) {
			$this->repository->sync_artist_genres( $post_id, isset( $mapped['meta']['_spotify_artist_genres'] ) ? (array) $mapped['meta']['_spotify_artist_genres'] : array() );
		}

		return $post_id;
	}

	protected function extract_artist_names( array $payload ) {
		$names = array();

		if ( empty( $payload['artists'] ) || ! is_array( $payload['artists'] ) ) {
			return $names;
		}

		foreach ( $payload['artists'] as $artist ) {
			if ( ! empty( $artist['name'] ) ) {
				$names[] = $this->normalize_display_text( $artist['name'] );
			}
		}

		return $names;
	}

	public function extract_primary_image( array $payload ) {
		if ( empty( $payload['images'] ) || ! is_array( $payload['images'] ) ) {
			return '';
		}

		$image = reset( $payload['images'] );

		return ! empty( $image['url'] ) ? esc_url_raw( $image['url'] ) : '';
	}

	protected function normalize_release_date( $release_date, $precision ) {
		$release_date = sanitize_text_field( (string) $release_date );
		$precision    = sanitize_key( (string) $precision );

		if ( 'year' === $precision ) {
			return $release_date . '-01-01 00:00:00';
		}

		if ( 'month' === $precision ) {
			return $release_date . '-01 00:00:00';
		}

		return $release_date . ' 00:00:00';
	}

	protected function normalize_label( $label ) {
		return $this->normalize_display_text( $label );
	}

	protected function build_album_post_content( array $release ) {
		$heading_content = $this->serialize_block(
			'core/heading',
			array(
				'content' => 'Tracklist',
				'level'   => 2,
			),
			'<h2>Tracklist</h2>'
		);

		$list_items = array();

		if ( ! empty( $release['tracks']['items'] ) && is_array( $release['tracks']['items'] ) ) {
			foreach ( $release['tracks']['items'] as $track ) {
				$track_number = isset( $track['track_number'] ) ? (int) $track['track_number'] : 0;
				$artist_names = implode( ' x ', $this->extract_artist_names( $track ) );
				$track_name   = isset( $track['name'] ) ? $this->normalize_display_text( $track['name'] ) : '';

				$list_items[] = sprintf(
					'<li>%s - %s - %s</li>',
					esc_html( (string) $track_number ),
					esc_html( $artist_names ),
					esc_html( $track_name )
				);
			}
		}

		$list_content = $this->serialize_block(
			'core/list',
			array(),
			'<ul>' . implode( '', $list_items ) . '</ul>'
		);

		$html_content = $this->serialize_block( 'core/html', array(), '' );

		return implode( "\n\n", array_filter( array( $heading_content, $list_content, $html_content ) ) );
	}

	protected function serialize_block( $block_name, array $attributes, $content ) {
		if ( function_exists( 'get_comment_delimited_block_content' ) ) {
			return get_comment_delimited_block_content( $block_name, $attributes, $content );
		}

		return (string) $content;
	}

	protected function normalize_display_text( $text ) {
		$text = trim( sanitize_text_field( (string) $text ) );

		if ( '' === $text ) {
			return '';
		}

		if ( function_exists( 'mb_convert_case' ) ) {
			return mb_convert_case( mb_strtolower( $text, 'UTF-8' ), MB_CASE_TITLE, 'UTF-8' );
		}

		return ucwords( strtolower( $text ) );
	}
}
