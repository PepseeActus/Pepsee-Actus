<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_CLI {
	public static function register( Pepsee_Spotify_Sync_Service $service ) {
		if ( ! defined( 'WP_CLI' ) || ! WP_CLI ) {
			return;
		}

		WP_CLI::add_command(
			'pepsee spotify-sync',
			function( $args, $assoc_args ) use ( $service ) {
				$run            = ! empty( $assoc_args['run'] );
				$dry_run        = ! $run;
				$batch_page     = ! empty( $assoc_args['batch-page'] ) ? max( 1, (int) $assoc_args['batch-page'] ) : 1;
				$artists_per_run = ! empty( $assoc_args['artists-per-run'] ) ? max( 1, (int) $assoc_args['artists-per-run'] ) : 0;

				if ( ! empty( $assoc_args['dry-run'] ) ) {
					$dry_run = true;
				}

				$payload = array(
					'dry_run'    => $dry_run,
					'batch_page' => $batch_page,
				);

				if ( $artists_per_run ) {
					$payload['artists_per_run'] = $artists_per_run;
				}

				$result = $service->run( $payload );

				WP_CLI::log( wp_json_encode( $result, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES ) );
				WP_CLI::success( $dry_run ? 'Dry run completed.' : 'Sync completed.' );
			}
		);
	}
}
