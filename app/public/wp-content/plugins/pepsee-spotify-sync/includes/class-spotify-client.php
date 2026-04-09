<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Spotify_Client {
	const OPTION_KEY = 'pepsee_spotify_sync_settings';
	const TOKEN_TRANSIENT = 'pepsee_spotify_sync_token';
	const USER_TOKEN_OPTION = 'pepsee_spotify_sync_user_token';
	const OAUTH_STATE_TRANSIENT = 'pepsee_spotify_sync_oauth_state';
	const API_BASE = 'https://api.spotify.com/v1';
	const AUTHORIZE_URL = 'https://accounts.spotify.com/authorize';
	const AUTH_URL = 'https://accounts.spotify.com/api/token';
	const MAX_RATE_LIMIT_RETRIES = 3;

	/**
	 * @var Pepsee_Spotify_Sync_Logger
	 */
	protected $logger;

	public function __construct( Pepsee_Spotify_Sync_Logger $logger ) {
		$this->logger = $logger;
	}

	public function request( $method, $path, array $query = array(), $body = null, $context = 'app' ) {
		return $this->perform_request( $method, $path, $query, $body, $context, 0 );
	}

	protected function perform_request( $method, $path, array $query = array(), $body = null, $context = 'app', $attempt = 0 ) {
		$token = 'user' === $context ? $this->get_user_access_token() : $this->get_access_token();

		if ( is_wp_error( $token ) ) {
			return $token;
		}

		$url = trailingslashit( self::API_BASE ) . ltrim( $path, '/' );

		if ( ! empty( $query ) ) {
			$url = add_query_arg( $query, $url );
		}

		$args = array(
			'method'  => strtoupper( $method ),
			'timeout' => 20,
			'headers' => array(
				'Authorization' => 'Bearer ' . $token,
				'Accept'        => 'application/json',
			),
		);

		if ( null !== $body ) {
			$args['headers']['Content-Type'] = 'application/json';
			$args['body']                    = wp_json_encode( $body );
		}

		$response = wp_remote_request( $url, $args );

		if ( is_wp_error( $response ) ) {
			$this->logger->error(
				'Spotify request failed.',
				array(
					'path'  => $path,
					'error' => $response->get_error_message(),
				)
			);

			return $response;
		}

		$code = (int) wp_remote_retrieve_response_code( $response );
		$body = json_decode( wp_remote_retrieve_body( $response ), true );

		if ( 429 === $code ) {
			$retry_after = (int) wp_remote_retrieve_header( $response, 'retry-after' );
			$retry_after = max( 1, $retry_after );

			$this->logger->warning(
				'Spotify API rate limit reached.',
				array(
					'path'        => $path,
					'attempt'     => (int) $attempt,
					'retry_after' => $retry_after,
				)
			);

			if ( $attempt < self::MAX_RATE_LIMIT_RETRIES ) {
				sleep( $retry_after + 1 );
				return $this->perform_request( $method, $path, $query, $body, $context, $attempt + 1 );
			}
		}

		if ( $code >= 400 ) {
			$message = isset( $body['error_description'] ) ? $body['error_description'] : __( 'Spotify API error.', 'pepsee-spotify-sync' );

			if ( isset( $body['error']['message'] ) ) {
				$message = $body['error']['message'];
			}

			$this->logger->error(
				'Spotify API returned an error.',
				array(
					'path'    => $path,
					'code'    => $code,
					'message' => $message,
				)
			);

			return new WP_Error( 'spotify_api_error', $message, array( 'status' => $code, 'body' => $body ) );
		}

		return is_array( $body ) ? $body : array();
	}

	public function get_access_token() {
		$cached = get_transient( self::TOKEN_TRANSIENT );

		if ( is_array( $cached ) && ! empty( $cached['access_token'] ) ) {
			return $cached['access_token'];
		}

		$settings = get_option( self::OPTION_KEY, array() );
		$client_id = isset( $settings['client_id'] ) ? trim( (string) $settings['client_id'] ) : '';
		$client_secret = isset( $settings['client_secret'] ) ? trim( (string) $settings['client_secret'] ) : '';

		if ( '' === $client_id || '' === $client_secret ) {
			return new WP_Error( 'spotify_missing_credentials', __( 'Spotify Client ID / Client Secret manquants.', 'pepsee-spotify-sync' ) );
		}

		$response = $this->request_token(
			array(
				'grant_type' => 'client_credentials',
			)
		);

		if ( is_wp_error( $response ) ) {
			return $response;
		}

		$body = $response;

		$expires_in = ! empty( $body['expires_in'] ) ? max( 60, (int) $body['expires_in'] - 60 ) : HOUR_IN_SECONDS;

		set_transient(
			self::TOKEN_TRANSIENT,
			array(
				'access_token' => $body['access_token'],
				'expires_at'   => time() + $expires_in,
			),
			$expires_in
		);

		return $body['access_token'];
	}

	public function get_authorization_url() {
		if ( '' === $this->get_client_id() || '' === $this->get_client_secret() ) {
			return new WP_Error( 'spotify_missing_credentials', __( 'Configure d’abord le Client ID et le Client Secret Spotify.', 'pepsee-spotify-sync' ) );
		}

		$state = wp_generate_password( 32, false, false );
		set_transient( self::OAUTH_STATE_TRANSIENT, $state, 10 * MINUTE_IN_SECONDS );

		return add_query_arg(
			array(
				'client_id'     => $this->get_client_id(),
				'response_type' => 'code',
				'redirect_uri'  => $this->get_redirect_uri(),
				'scope'         => 'user-follow-read',
				'state'         => $state,
				'show_dialog'   => 'true',
			),
			self::AUTHORIZE_URL
		);
	}

	public function handle_oauth_callback( $code, $state ) {
		if ( '' === (string) $code ) {
			return new WP_Error( 'spotify_missing_code', __( 'Le code OAuth Spotify est manquant.', 'pepsee-spotify-sync' ) );
		}

		$expected_state = get_transient( self::OAUTH_STATE_TRANSIENT );
		delete_transient( self::OAUTH_STATE_TRANSIENT );

		if ( ! $expected_state || ! hash_equals( $expected_state, (string) $state ) ) {
			return new WP_Error( 'spotify_invalid_state', __( 'La validation de sécurité Spotify a échoué.', 'pepsee-spotify-sync' ) );
		}

		$payload = $this->request_token(
			array(
				'grant_type'   => 'authorization_code',
				'code'         => sanitize_text_field( (string) $code ),
				'redirect_uri' => $this->get_redirect_uri(),
			)
		);

		if ( is_wp_error( $payload ) ) {
			return $payload;
		}

		$this->store_user_token_payload( $payload );
		$this->logger->info( 'Spotify user account connected.' );

		return $payload;
	}

	public function disconnect_user_account() {
		delete_option( self::USER_TOKEN_OPTION );
		$this->logger->info( 'Spotify user account disconnected.' );
	}

	public function get_user_connection() {
		$connection = get_option( self::USER_TOKEN_OPTION, array() );

		if ( ! is_array( $connection ) ) {
			return array();
		}

		return wp_parse_args(
			$connection,
			array(
				'access_token'  => '',
				'refresh_token' => '',
				'token_type'    => '',
				'scope'         => '',
				'expires_at'    => 0,
				'connected_at'  => '',
			)
		);
	}

	public function has_user_connection() {
		$connection = $this->get_user_connection();

		return ! empty( $connection['refresh_token'] ) || ! empty( $connection['access_token'] );
	}

	public function get_user_access_token() {
		$connection = $this->get_user_connection();

		if ( empty( $connection['access_token'] ) && empty( $connection['refresh_token'] ) ) {
			return new WP_Error( 'spotify_user_not_connected', __( 'Aucun compte Spotify utilisateur n’est connecté.', 'pepsee-spotify-sync' ) );
		}

		if ( ! empty( $connection['access_token'] ) && ! empty( $connection['expires_at'] ) && (int) $connection['expires_at'] > ( time() + 60 ) ) {
			return $connection['access_token'];
		}

		if ( empty( $connection['refresh_token'] ) ) {
			return new WP_Error( 'spotify_missing_refresh_token', __( 'Le refresh token Spotify est manquant.', 'pepsee-spotify-sync' ) );
		}

		$payload = $this->request_token(
			array(
				'grant_type'    => 'refresh_token',
				'refresh_token' => $connection['refresh_token'],
			)
		);

		if ( is_wp_error( $payload ) ) {
			return $payload;
		}

		$this->store_user_token_payload( $payload, $connection );
		$connection = $this->get_user_connection();

		return $connection['access_token'];
	}

	public function get_followed_artists( $limit = 50 ) {
		$artists = array();
		$after   = '';
		$limit   = max( 1, min( 50, (int) $limit ) );

		do {
			$query = array(
				'type'  => 'artist',
				'limit' => $limit,
			);

			if ( $after ) {
				$query['after'] = $after;
			}

			$response = $this->request( 'GET', 'me/following', $query, null, 'user' );

			if ( is_wp_error( $response ) ) {
				return $response;
			}

			$page_items = isset( $response['artists']['items'] ) ? (array) $response['artists']['items'] : array();
			$artists    = array_merge( $artists, $page_items );
			$after      = '';

			if ( ! empty( $response['artists']['cursors']['after'] ) ) {
				$after = sanitize_text_field( $response['artists']['cursors']['after'] );
			}
		} while ( $after );

		return $artists;
	}

	public function get_followed_artists_page( $limit = 20, $after = '' ) {
		$limit = max( 1, min( 50, (int) $limit ) );
		$query = array(
			'type'  => 'artist',
			'limit' => $limit,
		);

		if ( $after ) {
			$query['after'] = sanitize_text_field( $after );
		}

		$response = $this->request( 'GET', 'me/following', $query, null, 'user' );

		if ( is_wp_error( $response ) ) {
			return $response;
		}

		return array(
			'items'      => isset( $response['artists']['items'] ) ? (array) $response['artists']['items'] : array(),
			'next_after' => ! empty( $response['artists']['cursors']['after'] ) ? sanitize_text_field( $response['artists']['cursors']['after'] ) : '',
			'total'      => isset( $response['artists']['total'] ) ? (int) $response['artists']['total'] : 0,
		);
	}

	public function get_redirect_uri() {
		return admin_url( 'admin-post.php?action=pepsee_spotify_oauth_callback' );
	}

	protected function get_client_id() {
		$settings = get_option( self::OPTION_KEY, array() );

		return isset( $settings['client_id'] ) ? trim( (string) $settings['client_id'] ) : '';
	}

	protected function get_client_secret() {
		$settings = get_option( self::OPTION_KEY, array() );

		return isset( $settings['client_secret'] ) ? trim( (string) $settings['client_secret'] ) : '';
	}

	protected function request_token( array $body ) {
		$client_id     = $this->get_client_id();
		$client_secret = $this->get_client_secret();

		if ( '' === $client_id || '' === $client_secret ) {
			return new WP_Error( 'spotify_missing_credentials', __( 'Spotify Client ID / Client Secret manquants.', 'pepsee-spotify-sync' ) );
		}

		$response = wp_remote_post(
			self::AUTH_URL,
			array(
				'timeout' => 20,
				'headers' => array(
					'Authorization' => 'Basic ' . base64_encode( $client_id . ':' . $client_secret ),
					'Content-Type'  => 'application/x-www-form-urlencoded',
				),
				'body'    => $body,
			)
		);

		if ( is_wp_error( $response ) ) {
			$this->logger->error( 'Spotify token request failed.', array( 'error' => $response->get_error_message() ) );
			return $response;
		}

		$code = (int) wp_remote_retrieve_response_code( $response );
		$body = json_decode( wp_remote_retrieve_body( $response ), true );

		if ( $code >= 400 || empty( $body['access_token'] ) ) {
			$message = isset( $body['error_description'] ) ? $body['error_description'] : __( 'Impossible de récupérer le token Spotify.', 'pepsee-spotify-sync' );
			$this->logger->error( 'Spotify token request returned an error.', array( 'code' => $code, 'message' => $message ) );
			return new WP_Error( 'spotify_token_error', $message, array( 'status' => $code, 'body' => $body ) );
		}

		return $body;
	}

	protected function store_user_token_payload( array $payload, array $existing = array() ) {
		$connection = array(
			'access_token'  => isset( $payload['access_token'] ) ? sanitize_text_field( $payload['access_token'] ) : '',
			'refresh_token' => ! empty( $payload['refresh_token'] ) ? sanitize_text_field( $payload['refresh_token'] ) : ( isset( $existing['refresh_token'] ) ? $existing['refresh_token'] : '' ),
			'token_type'    => isset( $payload['token_type'] ) ? sanitize_text_field( $payload['token_type'] ) : '',
			'scope'         => isset( $payload['scope'] ) ? sanitize_text_field( $payload['scope'] ) : ( isset( $existing['scope'] ) ? $existing['scope'] : '' ),
			'expires_at'    => ! empty( $payload['expires_in'] ) ? ( time() + max( 60, (int) $payload['expires_in'] - 60 ) ) : 0,
			'connected_at'  => ! empty( $existing['connected_at'] ) ? $existing['connected_at'] : current_time( 'mysql' ),
		);

		update_option( self::USER_TOKEN_OPTION, $connection, false );
	}
}
