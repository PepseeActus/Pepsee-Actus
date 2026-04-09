<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Repository {
	const SETTINGS_OPTION = 'pepsee_spotify_sync_settings';
	const LAST_RUN_OPTION = 'pepsee_spotify_sync_last_run';
	const LAST_SCAN_OPTION = 'pepsee_spotify_sync_last_scan';
	const SEEN_RELEASES_OPTION = 'pepsee_spotify_sync_seen_releases';
	const ARTIST_SPOTIFY_META_KEY = '_pepsee_spotify_artist_id';

	/**
	 * @var Pepsee_Spotify_Sync_Logger
	 */
	protected $logger;

	public function __construct( Pepsee_Spotify_Sync_Logger $logger ) {
		$this->logger = $logger;
	}

	public function get_settings() {
		$defaults = array(
			'client_id'        => '',
			'client_secret'    => '',
			'sync_window_days' => 30,
			'artists_per_run'  => 25,
			'include_groups'   => array( 'album', 'single', 'appears_on' ),
		);

		$settings = get_option( self::SETTINGS_OPTION, array() );
		$settings = wp_parse_args( $settings, $defaults );
		$settings['sync_window_days'] = max( 1, absint( $settings['sync_window_days'] ) );
		$settings['artists_per_run']  = max( 1, absint( $settings['artists_per_run'] ) );
		$settings['include_groups']   = array_values( array_filter( array_map( 'sanitize_key', (array) $settings['include_groups'] ) ) );

		if ( empty( $settings['include_groups'] ) ) {
			$settings['include_groups'] = $defaults['include_groups'];
		}

		return $settings;
	}

	public function save_settings( $settings ) {
		if ( ! is_array( $settings ) ) {
			$settings = array();
		}

		$existing = $this->get_settings();
		$payload  = array(
			'client_id'        => isset( $settings['client_id'] ) ? sanitize_text_field( $settings['client_id'] ) : $existing['client_id'],
			'client_secret'    => isset( $settings['client_secret'] ) ? sanitize_text_field( $settings['client_secret'] ) : $existing['client_secret'],
			'sync_window_days' => isset( $settings['sync_window_days'] ) ? max( 1, absint( $settings['sync_window_days'] ) ) : $existing['sync_window_days'],
			'artists_per_run'  => isset( $settings['artists_per_run'] ) ? max( 1, absint( $settings['artists_per_run'] ) ) : $existing['artists_per_run'],
			'include_groups'   => isset( $settings['include_groups'] ) ? array_values( array_filter( array_map( 'sanitize_key', (array) $settings['include_groups'] ) ) ) : $existing['include_groups'],
		);

		return $payload;
	}

	public function extract_spotify_artist_id( $post_id ) {
		$spotify_id = trim( (string) get_post_meta( $post_id, self::ARTIST_SPOTIFY_META_KEY, true ) );

		if ( $spotify_id ) {
			return $spotify_id;
		}

		// Legacy storage used a key that collides with ACF's field reference meta.
		$legacy_meta = trim( (string) get_post_meta( $post_id, '_spotify_artist_id', true ) );

		if ( $legacy_meta && 0 !== strpos( $legacy_meta, 'field_' ) ) {
			return $legacy_meta;
		}

		$spotify_id = function_exists( 'get_field' ) ? trim( (string) get_field( 'spotify_artist_id', $post_id ) ) : '';

		if ( ! $spotify_id ) {
			$spotify_id = trim( (string) get_post_meta( $post_id, 'spotify_artist_id', true ) );
		}

		if ( $spotify_id ) {
			return $spotify_id;
		}

		$spotify_url = function_exists( 'get_field' ) ? trim( (string) get_field( 'spotify', $post_id ) ) : '';

		if ( ! $spotify_url ) {
			$spotify_url = trim( (string) get_post_meta( $post_id, 'spotify', true ) );
		}

		if ( preg_match( '#spotify\.com/artist/([A-Za-z0-9]+)#', $spotify_url, $matches ) ) {
			return $matches[1];
		}

		if ( preg_match( '#^spotify:artist:([A-Za-z0-9]+)$#', $spotify_url, $matches ) ) {
			return $matches[1];
		}

		return '';
	}

	public function find_artist_post_by_spotify_id( $spotify_id ) {
		$spotify_id = sanitize_text_field( (string) $spotify_id );

		if ( '' === $spotify_id ) {
			return 0;
		}

		$found = $this->find_post_by_spotify_meta( 'artist', self::ARTIST_SPOTIFY_META_KEY, $spotify_id );

		if ( $found ) {
			return $found;
		}

		$legacy = $this->find_post_by_spotify_meta( 'artist', '_spotify_artist_id', $spotify_id );

		if ( $legacy ) {
			return $legacy;
		}

		$query = new WP_Query(
			array(
				'post_type'              => 'artist',
				'post_status'            => array( 'publish', 'draft', 'pending', 'future', 'private' ),
				'posts_per_page'         => 1,
				'fields'                 => 'ids',
				'no_found_rows'          => true,
				'update_post_meta_cache' => false,
				'update_post_term_cache' => false,
				'meta_query'             => array(
					array(
						'key'     => 'spotify_artist_id',
						'value'   => $spotify_id,
						'compare' => '=',
					),
				),
			)
		);

		return ! empty( $query->posts[0] ) ? (int) $query->posts[0] : 0;
	}

	public function find_post_by_spotify_meta( $post_type, $meta_key, $spotify_id ) {
		$query = new WP_Query(
			array(
				'post_type'      => $post_type,
				'post_status'    => array( 'publish', 'draft', 'pending', 'future', 'private' ),
				'posts_per_page' => 1,
				'fields'         => 'ids',
				'meta_query'     => array(
					array(
						'key'     => $meta_key,
						'value'   => $spotify_id,
						'compare' => '=',
					),
				),
			)
		);

		return ! empty( $query->posts[0] ) ? (int) $query->posts[0] : 0;
	}

	public function get_or_create_artist_from_spotify( array $artist_payload, $dry_run = false ) {
		$spotify_id = isset( $artist_payload['id'] ) ? sanitize_text_field( $artist_payload['id'] ) : '';

		if ( ! $spotify_id ) {
			return 0;
		}

		$existing_id = $this->find_artist_post_by_spotify_id( $spotify_id );

		if ( $existing_id ) {
			return $existing_id;
		}

		$spotify_url = isset( $artist_payload['external_urls']['spotify'] ) ? esc_url_raw( $artist_payload['external_urls']['spotify'] ) : '';
		$name        = isset( $artist_payload['name'] ) ? $this->normalize_display_text( $artist_payload['name'] ) : __( 'Artist sans nom', 'pepsee-spotify-sync' );

		if ( $dry_run ) {
			return 0;
		}

		$post_id = wp_insert_post(
			array(
				'post_type'   => 'artist',
				'post_status' => 'draft',
				'post_title'  => $name,
			),
			true
		);

		if ( is_wp_error( $post_id ) ) {
			$this->logger->error( 'Unable to create missing artist.', array( 'name' => $name, 'error' => $post_id->get_error_message() ) );
			return 0;
		}

		update_post_meta( $post_id, self::ARTIST_SPOTIFY_META_KEY, $spotify_id );
		update_post_meta( $post_id, '_spotify_artist_id', $spotify_id );
		update_post_meta( $post_id, 'spotify_sync_enabled', '0' );
		$this->update_field_value( 'spotify_artist_id', $spotify_id, $post_id );
		$this->update_field_value( 'spotify', $spotify_url, $post_id );
		$this->update_field_value( 'artistes', $name, $post_id );
		$this->sync_artist_genres( $post_id, isset( $artist_payload['genres'] ) ? (array) $artist_payload['genres'] : array() );

		return (int) $post_id;
	}

	public function ensure_post( $post_type, array $postarr ) {
		$postarr['post_type']   = $post_type;
		$postarr['post_status'] = 'draft';

		if ( ! empty( $postarr['ID'] ) ) {
			return wp_update_post( $postarr, true );
		}

		if ( empty( $postarr['post_content'] ) ) {
			$postarr['post_content'] = $this->build_post_type_template_content( $post_type );
		}

		return wp_insert_post( $postarr, true );
	}

	public function update_field_value( $field_name, $value, $post_id ) {
		if ( function_exists( 'update_field' ) ) {
			return update_field( $field_name, $value, $post_id );
		}

		return update_post_meta( $post_id, $field_name, $value );
	}

	public function maybe_set_field_value( $field_name, $value, $post_id, $overwrite = false ) {
		$current = function_exists( 'get_field' ) ? get_field( $field_name, $post_id, false ) : get_post_meta( $post_id, $field_name, true );

		if ( $overwrite || $this->is_empty_value( $current ) ) {
			return $this->update_field_value( $field_name, $value, $post_id );
		}

		return false;
	}

	public function update_spotify_meta( $post_id, array $meta ) {
		foreach ( $meta as $key => $value ) {
			if ( is_array( $value ) ) {
				$value = wp_json_encode( $value );
			}

			update_post_meta( $post_id, $key, $value );
		}
	}

	public function search_posts_for_merge( $post_type, $search = '', $limit = 20 ) {
		$args = array(
			'post_type'              => $post_type,
			'post_status'            => array( 'publish', 'draft', 'pending', 'future', 'private' ),
			'posts_per_page'         => max( 1, min( 50, (int) $limit ) ),
			'orderby'                => 'date',
			'order'                  => 'DESC',
			'no_found_rows'          => true,
			'update_post_meta_cache' => false,
			'update_post_term_cache' => false,
		);

		$search = sanitize_text_field( (string) $search );

		if ( '' !== $search ) {
			$args['s'] = $search;
		}

		return get_posts( $args );
	}

	public function sync_artist_genres( $post_id, array $genres ) {
		$genres = array_filter( array_map( 'sanitize_text_field', $genres ) );

		if ( empty( $genres ) ) {
			return array();
		}

		$term_ids = array();

		foreach ( $genres as $genre ) {
			$genre = $this->normalize_genre_label( $genre );

			$term = term_exists( $genre, 'genre' );

			if ( ! $term ) {
				$term = wp_insert_term( $genre, 'genre' );
			}

			if ( is_wp_error( $term ) ) {
				continue;
			}

			$term_ids[] = is_array( $term ) ? (int) $term['term_id'] : (int) $term;
		}

		if ( ! empty( $term_ids ) ) {
			wp_set_object_terms( $post_id, $term_ids, 'genre', false );
			$this->update_field_value( 'genres', $term_ids, $post_id );
		}

		return $term_ids;
	}

	protected function normalize_genre_label( $genre ) {
		return $this->normalize_display_text( $genre );
	}

	protected function build_post_type_template_content( $post_type ) {
		$post_type_object = get_post_type_object( $post_type );

		if ( empty( $post_type_object ) || empty( $post_type_object->template ) || ! is_array( $post_type_object->template ) ) {
			return '';
		}

		$blocks = array();

		foreach ( $post_type_object->template as $template_block ) {
			$serialized = $this->serialize_template_block( $template_block );

			if ( '' !== $serialized ) {
				$blocks[] = $serialized;
			}
		}

		return implode( "\n\n", $blocks );
	}

	protected function serialize_template_block( $template_block ) {
		if ( empty( $template_block ) || ! is_array( $template_block ) || empty( $template_block[0] ) ) {
			return '';
		}

		$block_name  = sanitize_text_field( (string) $template_block[0] );
		$attributes  = ! empty( $template_block[1] ) && is_array( $template_block[1] ) ? $template_block[1] : array();
		$inner_items = ! empty( $template_block[2] ) && is_array( $template_block[2] ) ? $template_block[2] : array();
		$content     = $this->get_template_block_inner_html( $block_name, $attributes );

		if ( ! empty( $inner_items ) ) {
			$inner_content = array();

			foreach ( $inner_items as $inner_item ) {
				$inner_serialized = $this->serialize_template_block( $inner_item );

				if ( '' !== $inner_serialized ) {
					$inner_content[] = $inner_serialized;
				}
			}

			if ( ! empty( $inner_content ) ) {
				$content .= implode( '', $inner_content );
			}
		}

		if ( function_exists( 'get_comment_delimited_block_content' ) ) {
			return get_comment_delimited_block_content( $block_name, $attributes, $content );
		}

		return $content;
	}

	protected function get_template_block_inner_html( $block_name, array $attributes ) {
		switch ( $block_name ) {
			case 'core/heading':
				$level   = ! empty( $attributes['level'] ) ? max( 1, min( 6, (int) $attributes['level'] ) ) : 2;
				$content = isset( $attributes['content'] ) ? wp_kses_post( (string) $attributes['content'] ) : '';
				return sprintf( '<h%d>%s</h%d>', $level, $content, $level );

			case 'core/list':
				return '<ul></ul>';

			case 'core/paragraph':
				$content = isset( $attributes['content'] ) ? wp_kses_post( (string) $attributes['content'] ) : '';
				return sprintf( '<p>%s</p>', $content );

			default:
				return '';
		}
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

	public function sideload_featured_image( $image_url, $post_id, $description = '', $filename_base = '', $force_replace = false ) {
		if ( ! $image_url ) {
			return 0;
		}

		if ( ! $force_replace && has_post_thumbnail( $post_id ) ) {
			return 0;
		}

		if ( ! function_exists( 'media_handle_sideload' ) ) {
			require_once ABSPATH . 'wp-admin/includes/media.php';
			require_once ABSPATH . 'wp-admin/includes/file.php';
			require_once ABSPATH . 'wp-admin/includes/image.php';
		}

		$temp_file = download_url( $image_url );

		if ( is_wp_error( $temp_file ) ) {
			$this->logger->warning( 'Unable to download Spotify image.', array( 'url' => $image_url, 'error' => $temp_file->get_error_message() ) );
			return 0;
		}

		$file = array(
			'name'     => $this->build_image_filename( $image_url, $filename_base ),
			'tmp_name' => $temp_file,
		);

		$attachment_id = media_handle_sideload( $file, $post_id, $description );

		if ( is_wp_error( $attachment_id ) ) {
			@unlink( $temp_file );
			$this->logger->warning( 'Unable to sideload Spotify image.', array( 'url' => $image_url, 'error' => $attachment_id->get_error_message() ) );
			return 0;
		}

		set_post_thumbnail( $post_id, $attachment_id );

		return (int) $attachment_id;
	}

	protected function build_image_filename( $image_url, $filename_base = '' ) {
		$path      = (string) parse_url( $image_url, PHP_URL_PATH );
		$extension = pathinfo( wp_basename( $path ), PATHINFO_EXTENSION );
		$extension = $extension ? strtolower( $extension ) : 'jpg';
		$base      = sanitize_title( (string) $filename_base );

		if ( '' === $base ) {
			$base = pathinfo( wp_basename( $path ), PATHINFO_FILENAME );
			$base = sanitize_title( $base );
		}

		if ( '' === $base ) {
			$base = 'spotify-cover';
		}

		return $base . '.' . $extension;
	}

	public function set_last_run( array $result ) {
		update_option( self::LAST_RUN_OPTION, $result, false );
	}

	public function get_last_run() {
		return get_option( self::LAST_RUN_OPTION, array() );
	}

	public function set_last_scan( array $result ) {
		update_option( self::LAST_SCAN_OPTION, $result, false );
	}

	public function get_last_scan() {
		return get_option( self::LAST_SCAN_OPTION, array() );
	}

	public function get_cached_artist_releases( $spotify_artist_id, array $include_groups ) {
		$cache_key = $this->build_artist_releases_cache_key( $spotify_artist_id, $include_groups );
		$cached    = get_transient( $cache_key );

		return is_array( $cached ) ? $cached : null;
	}

	public function set_cached_artist_releases( $spotify_artist_id, array $include_groups, array $releases ) {
		$cache_key = $this->build_artist_releases_cache_key( $spotify_artist_id, $include_groups );
		set_transient( $cache_key, array_values( $releases ), HOUR_IN_SECONDS );
	}

	public function get_seen_release_ids() {
		$seen = get_option( self::SEEN_RELEASES_OPTION, array() );

		return is_array( $seen ) ? $seen : array();
	}

	public function has_seen_release_id( $spotify_release_id ) {
		$spotify_release_id = sanitize_text_field( (string) $spotify_release_id );

		if ( '' === $spotify_release_id ) {
			return false;
		}

		$seen = $this->get_seen_release_ids();

		return isset( $seen[ $spotify_release_id ] );
	}

	public function mark_release_ids_seen( array $release_ids ) {
		$release_ids = array_values( array_unique( array_filter( array_map( 'sanitize_text_field', $release_ids ) ) ) );

		if ( empty( $release_ids ) ) {
			return;
		}

		$seen = $this->get_seen_release_ids();
		$now  = current_time( 'mysql' );

		foreach ( $release_ids as $release_id ) {
			$seen[ $release_id ] = $now;
		}

		if ( count( $seen ) > 5000 ) {
			$seen = array_slice( $seen, -5000, null, true );
		}

		update_option( self::SEEN_RELEASES_OPTION, $seen, false );
	}

	protected function is_empty_value( $value ) {
		if ( null === $value ) {
			return true;
		}

		if ( '' === $value || false === $value ) {
			return true;
		}

		if ( is_array( $value ) ) {
			return empty( $value );
		}

		return false;
	}

	protected function build_artist_releases_cache_key( $spotify_artist_id, array $include_groups ) {
		$spotify_artist_id = sanitize_key( (string) $spotify_artist_id );
		$include_groups    = array_values( array_filter( array_map( 'sanitize_key', $include_groups ) ) );
		sort( $include_groups );

		return 'pepsee_spotify_artist_releases_' . md5( $spotify_artist_id . '|' . implode( ',', $include_groups ) );
	}

}
