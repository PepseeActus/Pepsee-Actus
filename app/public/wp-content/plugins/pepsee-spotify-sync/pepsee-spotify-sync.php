<?php
/**
 * Plugin Name: Pepsee Spotify Sync
 * Description: Synchronisation manuelle des sorties Spotify vers PepseeActus.
 * Version: 1.0.0
 * Author: Codex
 * Text Domain: pepsee-spotify-sync
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'PEPSEE_SPOTIFY_SYNC_VERSION', '1.0.0' );
define( 'PEPSEE_SPOTIFY_SYNC_PLUGIN_FILE', __FILE__ );
define( 'PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR', plugin_dir_path( __FILE__ ) );
define( 'PEPSEE_SPOTIFY_SYNC_PLUGIN_URL', plugin_dir_url( __FILE__ ) );

require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-logger.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-spotify-client.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-repository.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-mapper.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-sync-service.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-admin-settings.php';
require_once PEPSEE_SPOTIFY_SYNC_PLUGIN_DIR . 'includes/class-cli.php';

function pepsee_spotify_sync_register_local_acf_fields() {
	if ( ! function_exists( 'acf_add_local_field_group' ) ) {
		return;
	}

	acf_add_local_field_group(
		array(
			'key'                   => 'group_pepsee_spotify_sync_artist',
			'title'                 => 'Spotify Artist ID',
			'fields'                => array(
				array(
					'key'           => 'field_pepsee_spotify_artist_id',
					'label'         => 'Spotify Artist ID',
					'name'          => 'spotify_artist_id',
					'type'          => 'text',
					'instructions'  => 'ID Spotify brut, par exemple 3TVXtAsR1Inumwj472S9r4. Prioritaire sur l’URL Spotify si renseigné.',
					'required'      => 0,
					'default_value' => '',
					'placeholder'   => '3TVXtAsR1Inumwj472S9r4',
				),
			),
			'location'              => array(
				array(
					array(
						'param'    => 'post_type',
						'operator' => '==',
						'value'    => 'artist',
					),
				),
			),
			'menu_order'            => 200,
			'position'              => 'normal',
			'style'                 => 'default',
			'label_placement'       => 'top',
			'instruction_placement' => 'label',
			'active'                => true,
			'show_in_rest'          => 0,
		)
	);
}

function pepsee_spotify_sync_boot() {
	static $booted = false;

	if ( $booted ) {
		return;
	}

	$booted  = true;
	$logger  = new Pepsee_Spotify_Sync_Logger();
	$repo    = new Pepsee_Spotify_Sync_Repository( $logger );
	$client  = new Pepsee_Spotify_Sync_Spotify_Client( $logger );
	$mapper  = new Pepsee_Spotify_Sync_Mapper( $repo, $logger );
	$service = new Pepsee_Spotify_Sync_Service( $client, $repo, $mapper, $logger );

	new Pepsee_Spotify_Sync_Admin_Settings( $service, $repo, $logger, $client );
	Pepsee_Spotify_Sync_CLI::register( $service );
}

add_action( 'plugins_loaded', 'pepsee_spotify_sync_boot' );
add_action( 'acf/init', 'pepsee_spotify_sync_register_local_acf_fields' );
