<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Logger {
	const OPTION_KEY = 'pepsee_spotify_sync_logs';
	const MAX_ENTRIES = 200;

	public function add( $level, $message, array $context = array() ) {
		$logs   = get_option( self::OPTION_KEY, array() );
		$logs[] = array(
			'timestamp' => current_time( 'mysql' ),
			'level'     => sanitize_key( $level ),
			'message'   => wp_strip_all_tags( (string) $message ),
			'context'   => $this->sanitize_context( $context ),
		);

		if ( count( $logs ) > self::MAX_ENTRIES ) {
			$logs = array_slice( $logs, -1 * self::MAX_ENTRIES );
		}

		update_option( self::OPTION_KEY, $logs, false );
	}

	public function info( $message, array $context = array() ) {
		$this->add( 'info', $message, $context );
	}

	public function warning( $message, array $context = array() ) {
		$this->add( 'warning', $message, $context );
	}

	public function error( $message, array $context = array() ) {
		$this->add( 'error', $message, $context );
	}

	public function get_logs( $limit = 50 ) {
		$logs = get_option( self::OPTION_KEY, array() );
		$logs = array_reverse( $logs );

		if ( $limit > 0 ) {
			$logs = array_slice( $logs, 0, $limit );
		}

		return $logs;
	}

	public function clear() {
		delete_option( self::OPTION_KEY );
	}

	protected function sanitize_context( array $context ) {
		$clean = array();

		foreach ( $context as $key => $value ) {
			$key = sanitize_key( (string) $key );

			if ( is_scalar( $value ) || null === $value ) {
				$clean[ $key ] = $value;
				continue;
			}

			if ( is_array( $value ) ) {
				$clean[ $key ] = wp_json_encode( $value );
				continue;
			}

			if ( is_object( $value ) && isset( $value->ID ) ) {
				$clean[ $key ] = sprintf( 'object:%s', $value->ID );
				continue;
			}

			$clean[ $key ] = gettype( $value );
		}

		return $clean;
	}
}
