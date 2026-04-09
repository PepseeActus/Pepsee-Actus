<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

class Pepsee_Spotify_Sync_Admin_Settings {
	const MENU_SLUG = 'pepsee-spotify-sync';

	/**
	 * @var Pepsee_Spotify_Sync_Service
	 */
	protected $service;

	/**
	 * @var Pepsee_Spotify_Sync_Repository
	 */
	protected $repository;

	/**
	 * @var Pepsee_Spotify_Sync_Logger
	 */
	protected $logger;

	/**
	 * @var Pepsee_Spotify_Sync_Spotify_Client
	 */
	protected $client;

	public function __construct(
		Pepsee_Spotify_Sync_Service $service,
		Pepsee_Spotify_Sync_Repository $repository,
		Pepsee_Spotify_Sync_Logger $logger,
		?Pepsee_Spotify_Sync_Spotify_Client $client = null
	) {
		$this->service    = $service;
		$this->repository = $repository;
		$this->logger     = $logger;
		$this->client     = $client ? $client : new Pepsee_Spotify_Sync_Spotify_Client( $logger );

		add_action( 'admin_menu', array( $this, 'register_menu' ) );
		add_action( 'admin_init', array( $this, 'register_settings' ) );
		add_action( 'admin_post_pepsee_spotify_sync_run', array( $this, 'handle_run' ) );
		add_action( 'admin_post_pepsee_spotify_connect', array( $this, 'handle_connect' ) );
		add_action( 'admin_post_pepsee_spotify_disconnect', array( $this, 'handle_disconnect' ) );
		add_action( 'admin_post_pepsee_spotify_oauth_callback', array( $this, 'handle_oauth_callback' ) );
		add_action( 'admin_post_pepsee_spotify_import_single_release', array( $this, 'handle_import_single_release' ) );
		add_action( 'admin_post_pepsee_spotify_merge_into_post', array( $this, 'handle_merge_into_post' ) );
		add_action( 'admin_post_pepsee_spotify_view_release_json', array( $this, 'handle_view_release_json' ) );
		add_action( 'wp_ajax_pepsee_spotify_scan_step', array( $this, 'handle_ajax_scan_step' ) );
	}

	public function register_menu() {
		add_menu_page(
			__( 'Pepsee Spotify Sync', 'pepsee-spotify-sync' ),
			__( 'Pepsee Spotify Sync', 'pepsee-spotify-sync' ),
			'manage_options',
			self::MENU_SLUG,
			array( $this, 'render_settings_page' ),
			'dashicons-format-audio'
		);

		add_submenu_page(
			self::MENU_SLUG,
			__( 'Settings', 'pepsee-spotify-sync' ),
			__( 'Settings', 'pepsee-spotify-sync' ),
			'manage_options',
			self::MENU_SLUG,
			array( $this, 'render_settings_page' )
		);

	}

	public function register_settings() {
		register_setting(
			'pepsee_spotify_sync',
			Pepsee_Spotify_Sync_Repository::SETTINGS_OPTION,
			array( $this->repository, 'save_settings' )
		);
	}

	public function handle_run() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_sync_run' );

		$mode       = isset( $_POST['mode'] ) ? sanitize_key( $_POST['mode'] ) : 'scan';
		$batch_page = ! empty( $_POST['batch_page'] ) ? max( 1, absint( $_POST['batch_page'] ) ) : 1;
		$dry_run    = 'scan' === $mode;
		$args       = array(
			'dry_run'    => $dry_run,
			'batch_page' => $batch_page,
		);

		if ( $dry_run ) {
			$args['sync_window_days_override'] = 7;
		}

		$result = $this->service->run( $args );

		set_transient( 'pepsee_spotify_sync_admin_result', $result, 5 * MINUTE_IN_SECONDS );

		if ( $dry_run ) {
			$this->repository->set_last_scan( $result );
		}

		wp_safe_redirect( $this->admin_url( self::MENU_SLUG, array( 'result' => $dry_run ? 'scan' : 'run' ) ) );
		exit;
	}

	public function handle_import_single_release() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_import_single_release' );

		$release_id = isset( $_POST['release_id'] ) ? sanitize_text_field( wp_unslash( $_POST['release_id'] ) ) : '';
		$result     = $this->service->import_single_release( $release_id );

		if ( is_wp_error( $result ) ) {
			$this->redirect_with_notice( self::MENU_SLUG, 'import-error', $result->get_error_message() );
		}

		set_transient( 'pepsee_spotify_sync_admin_result', $result, 5 * MINUTE_IN_SECONDS );

		$primary_post_id = ! empty( $result['primary_post_id'] ) ? (int) $result['primary_post_id'] : 0;

		if ( ! $primary_post_id && ! empty( $result['primary_album_id'] ) ) {
			$primary_post_id = (int) $result['primary_album_id'];
		}

		if ( $primary_post_id ) {
			wp_safe_redirect(
				add_query_arg(
					array(
						'post'   => $primary_post_id,
						'action' => 'edit',
					),
					admin_url( 'post.php' )
				)
			);
			exit;
		}

		wp_safe_redirect( $this->admin_url( self::MENU_SLUG, array( 'result' => 'import' ) ) );
		exit;
	}

	public function handle_view_release_json() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_view_release_json' );

		$release_id = isset( $_REQUEST['release_id'] ) ? sanitize_text_field( wp_unslash( $_REQUEST['release_id'] ) ) : '';

		if ( '' === $release_id ) {
			wp_die( esc_html__( 'Release Spotify manquante.', 'pepsee-spotify-sync' ), 400 );
		}

		$release = $this->client->request( 'GET', sprintf( 'albums/%s', rawurlencode( $release_id ) ), array( 'market' => 'FR' ) );

		if ( is_wp_error( $release ) ) {
			wp_die( esc_html( $release->get_error_message() ), 500 );
		}

		nocache_headers();
		header( 'Content-Type: application/json; charset=' . get_option( 'blog_charset' ) );

		echo wp_json_encode( $release, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES );
		exit;
	}

	public function handle_merge_into_post() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_merge_into_post' );

		$release_id = isset( $_POST['release_id'] ) ? sanitize_text_field( wp_unslash( $_POST['release_id'] ) ) : '';
		$post_id    = isset( $_POST['target_post_id'] ) ? absint( $_POST['target_post_id'] ) : 0;
		$result     = $this->service->merge_release_into_existing_post( $release_id, $post_id );

		if ( is_wp_error( $result ) ) {
			$this->redirect_with_notice(
				self::MENU_SLUG,
				'merge-error',
				$result->get_error_message(),
				array(
					'view'       => 'merge_release',
					'release_id' => $release_id,
				)
			);
		}

		wp_safe_redirect(
			add_query_arg(
				array(
					'post'   => $post_id,
					'action' => 'edit',
				),
				admin_url( 'post.php' )
			)
		);
		exit;
	}

	public function handle_ajax_scan_step() {
		$this->assert_manage_options();
		check_ajax_referer( 'pepsee_spotify_scan_step' );

		$after      = isset( $_POST['after'] ) ? sanitize_text_field( wp_unslash( $_POST['after'] ) ) : '';
		$page_size  = isset( $_POST['page_size'] ) ? max( 1, min( 20, absint( $_POST['page_size'] ) ) ) : 10;
		$carry_json = isset( $_POST['carry'] ) ? wp_unslash( $_POST['carry'] ) : '';
		$carry      = json_decode( (string) $carry_json, true );
		$carry      = is_array( $carry ) ? $carry : array();
		$settings   = $this->repository->get_settings();
		$page       = $this->client->get_followed_artists_page( $page_size, $after );

		if ( is_wp_error( $page ) ) {
			wp_send_json_error( array( 'message' => $page->get_error_message() ), 500 );
		}

		$stats = $this->service->scan_followed_artists_chunk(
			isset( $page['items'] ) ? (array) $page['items'] : array(),
			array(
				'include_groups'   => $settings['include_groups'],
				'sync_window_days' => 7,
			),
			$carry
		);

		$stats['followed_artists'] = isset( $page['total'] ) ? (int) $page['total'] : ( isset( $stats['followed_artists'] ) ? (int) $stats['followed_artists'] : 0 );

		if ( empty( $page['next_after'] ) ) {
			unset( $stats['_seen_release_ids'] );
			$stats['finished_at'] = current_time( 'mysql' );
			$this->repository->set_last_scan( $stats );
			set_transient( 'pepsee_spotify_sync_admin_result', $stats, 5 * MINUTE_IN_SECONDS );
		}

		wp_send_json_success(
			array(
				'carry'      => $stats,
				'next_after' => isset( $page['next_after'] ) ? $page['next_after'] : '',
				'total'      => isset( $page['total'] ) ? (int) $page['total'] : 0,
				'done'       => empty( $page['next_after'] ),
			)
		);
	}

	public function handle_connect() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_connect' );

		$auth_url = $this->client->get_authorization_url();

		if ( is_wp_error( $auth_url ) ) {
			$this->redirect_with_notice( self::MENU_SLUG, 'oauth-error', $auth_url->get_error_message() );
		}

		wp_redirect( $auth_url );
		exit;
	}

	public function handle_disconnect() {
		$this->assert_manage_options();
		check_admin_referer( 'pepsee_spotify_disconnect' );

		$this->client->disconnect_user_account();
		$this->redirect_with_notice( self::MENU_SLUG, 'oauth-disconnected', __( 'Compte Spotify déconnecté.', 'pepsee-spotify-sync' ) );
	}

	public function handle_oauth_callback() {
		$this->assert_manage_options();

		if ( ! empty( $_GET['error'] ) ) {
			$this->redirect_with_notice( self::MENU_SLUG, 'oauth-error', sanitize_text_field( wp_unslash( $_GET['error'] ) ) );
		}

		$code  = isset( $_GET['code'] ) ? wp_unslash( $_GET['code'] ) : '';
		$state = isset( $_GET['state'] ) ? wp_unslash( $_GET['state'] ) : '';

		$result = $this->client->handle_oauth_callback( $code, $state );

		if ( is_wp_error( $result ) ) {
			$this->redirect_with_notice( self::MENU_SLUG, 'oauth-error', $result->get_error_message() );
		}

		$this->redirect_with_notice( self::MENU_SLUG, 'oauth-connected', __( 'Compte Spotify connecté. La sync utilisera maintenant directement tes artistes suivis Spotify.', 'pepsee-spotify-sync' ) );
	}


	public function render_settings_page() {
		if ( ! current_user_can( 'manage_options' ) ) {
			return;
		}

		if ( isset( $_GET['view'] ) && 'merge_release' === sanitize_key( wp_unslash( $_GET['view'] ) ) ) {
			$this->render_merge_release_page();
			return;
		}

		$settings       = $this->repository->get_settings();
		$last_scan      = $this->repository->get_last_scan();
		$current_result = get_transient( 'pepsee_spotify_sync_admin_result' );
		$connection     = $this->client->get_user_connection();
		$followed_count = 0;
		$followed_error = '';

		if ( $this->client->has_user_connection() ) {
			$followed = $this->client->get_followed_artists();

			if ( is_wp_error( $followed ) ) {
				$followed_error = $followed->get_error_message();
			} else {
				$followed_count = count( $followed );
			}
		}

		if ( $current_result ) {
			delete_transient( 'pepsee_spotify_sync_admin_result' );
		}
		?>
		<div class="wrap">
			<h1><?php esc_html_e( 'Pepsee Spotify Sync', 'pepsee-spotify-sync' ); ?></h1>
			<?php $this->render_notice(); ?>

			<h2><?php esc_html_e( 'Module 1: Connexion Spotify', 'pepsee-spotify-sync' ); ?></h2>
			<p><?php esc_html_e( 'Ce module connecte ton compte Spotify personnel pour lire tes artistes suivis et synchroniser automatiquement leurs albums et titres en brouillon.', 'pepsee-spotify-sync' ); ?></p>
			<p><strong><?php esc_html_e( 'Redirect URI à configurer dans Spotify Developer Dashboard :', 'pepsee-spotify-sync' ); ?></strong> <code><?php echo esc_html( $this->client->get_redirect_uri() ); ?></code></p>
			<p><strong><?php esc_html_e( 'Scopes utilisés :', 'pepsee-spotify-sync' ); ?></strong> <code>user-follow-read</code></p>
			<p>
				<strong><?php esc_html_e( 'Statut :', 'pepsee-spotify-sync' ); ?></strong>
				<?php echo $this->client->has_user_connection() ? esc_html__( 'Compte connecté', 'pepsee-spotify-sync' ) : esc_html__( 'Aucun compte connecté', 'pepsee-spotify-sync' ); ?>
			</p>
			<?php if ( $this->client->has_user_connection() ) : ?>
				<p><strong><?php esc_html_e( 'Dernière connexion :', 'pepsee-spotify-sync' ); ?></strong> <?php echo esc_html( $connection['connected_at'] ); ?></p>
				<form method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>" style="display:inline-block;margin-right:8px;">
					<input type="hidden" name="action" value="pepsee_spotify_disconnect">
					<?php wp_nonce_field( 'pepsee_spotify_disconnect' ); ?>
					<button type="submit" class="button"><?php esc_html_e( 'Disconnect Spotify', 'pepsee-spotify-sync' ); ?></button>
				</form>
				<p><strong><?php esc_html_e( 'Artistes suivis détectés :', 'pepsee-spotify-sync' ); ?></strong> <?php echo esc_html( $followed_count ); ?></p>
				<?php if ( $followed_error ) : ?>
					<p><span style="color:#b32d2e;"><?php echo esc_html( $followed_error ); ?></span></p>
				<?php endif; ?>
			<?php else : ?>
				<form method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>" style="display:inline-block;">
					<input type="hidden" name="action" value="pepsee_spotify_connect">
					<?php wp_nonce_field( 'pepsee_spotify_connect' ); ?>
					<button type="submit" class="button button-primary"><?php esc_html_e( 'Connect Spotify Account', 'pepsee-spotify-sync' ); ?></button>
				</form>
			<?php endif; ?>

			<hr>

			<h2><?php esc_html_e( 'Module 2: Sync settings', 'pepsee-spotify-sync' ); ?></h2>
			<p><?php esc_html_e( 'La sync part maintenant directement de tes artistes suivis Spotify. Aucun mapping manuel n’est nécessaire.', 'pepsee-spotify-sync' ); ?></p>
			<p><?php esc_html_e( 'Tous les contenus créés ou mis à jour restent en draft.', 'pepsee-spotify-sync' ); ?></p>
			<p><strong><?php esc_html_e( 'Source actuelle :', 'pepsee-spotify-sync' ); ?></strong> <?php echo esc_html( $followed_count ); ?> <?php esc_html_e( 'artistes suivis Spotify', 'pepsee-spotify-sync' ); ?></p>

			<form method="post" action="options.php">
				<?php settings_fields( 'pepsee_spotify_sync' ); ?>
				<table class="form-table" role="presentation">
					<tr>
						<th scope="row"><label for="pepsee-client-id"><?php esc_html_e( 'Client ID', 'pepsee-spotify-sync' ); ?></label></th>
						<td><input id="pepsee-client-id" type="text" class="regular-text" name="<?php echo esc_attr( Pepsee_Spotify_Sync_Repository::SETTINGS_OPTION ); ?>[client_id]" value="<?php echo esc_attr( $settings['client_id'] ); ?>"></td>
					</tr>
					<tr>
						<th scope="row"><label for="pepsee-client-secret"><?php esc_html_e( 'Client Secret', 'pepsee-spotify-sync' ); ?></label></th>
						<td><input id="pepsee-client-secret" type="password" class="regular-text" name="<?php echo esc_attr( Pepsee_Spotify_Sync_Repository::SETTINGS_OPTION ); ?>[client_secret]" value="<?php echo esc_attr( $settings['client_secret'] ); ?>" autocomplete="new-password"></td>
					</tr>
					<tr>
						<th scope="row"><label for="pepsee-sync-window"><?php esc_html_e( 'sync_window_days', 'pepsee-spotify-sync' ); ?></label></th>
						<td><input id="pepsee-sync-window" type="number" min="1" name="<?php echo esc_attr( Pepsee_Spotify_Sync_Repository::SETTINGS_OPTION ); ?>[sync_window_days]" value="<?php echo esc_attr( $settings['sync_window_days'] ); ?>"></td>
					</tr>
					<tr>
						<th scope="row"><?php esc_html_e( 'include_groups', 'pepsee-spotify-sync' ); ?></th>
						<td>
							<?php foreach ( array( 'album', 'single', 'appears_on', 'compilation' ) as $group ) : ?>
								<label style="display:block;margin-bottom:4px;">
									<input type="checkbox" name="<?php echo esc_attr( Pepsee_Spotify_Sync_Repository::SETTINGS_OPTION ); ?>[include_groups][]" value="<?php echo esc_attr( $group ); ?>" <?php checked( in_array( $group, $settings['include_groups'], true ) ); ?>>
									<?php echo esc_html( $group ); ?>
								</label>
							<?php endforeach; ?>
						</td>
					</tr>
				</table>
				<?php submit_button( __( 'Save Settings', 'pepsee-spotify-sync' ) ); ?>
			</form>

			<hr>

			<div style="margin:0 0 12px;">
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:8px;max-width:760px;">
					<strong style="display:block;margin-bottom:8px;"><?php esc_html_e( 'Scan global 7 jours', 'pepsee-spotify-sync' ); ?></strong>
					<p style="margin:0 0 10px;color:#50575e;"><?php esc_html_e( 'Le scan AJAX parcourt tous tes artistes suivis sans bloquer une seule requête PHP, puis construit la preview des sorties récentes.', 'pepsee-spotify-sync' ); ?></p>
					<button type="button" id="pepsee-scan-button" class="button"><?php esc_html_e( 'Scanner les sorties des 7 derniers jours', 'pepsee-spotify-sync' ); ?></button>
				</div>
			</div>
			<div id="pepsee-scan-progress" style="display:none;margin:12px 0 0;padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:8px;">
				<div style="display:flex;justify-content:space-between;gap:12px;align-items:center;flex-wrap:wrap;">
					<strong><?php esc_html_e( 'Scan en cours…', 'pepsee-spotify-sync' ); ?></strong>
					<span id="pepsee-scan-progress-text"><?php esc_html_e( 'Initialisation…', 'pepsee-spotify-sync' ); ?></span>
				</div>
				<div style="height:10px;background:#f0f0f1;border-radius:999px;overflow:hidden;margin-top:10px;">
					<div id="pepsee-scan-progress-bar" style="height:100%;width:0;background:#2271b1;"></div>
				</div>
			</div>
			<p><small><?php esc_html_e( 'Le scan interroge Spotify sur les 7 derniers jours et affiche les releases détectées, sans rien écrire dans WordPress.', 'pepsee-spotify-sync' ); ?></small></p>
			<p><small><?php esc_html_e( 'Ensuite, crée seulement les drafts qui t’intéressent directement depuis chaque carte release.', 'pepsee-spotify-sync' ); ?></small></p>
			<script>
				document.addEventListener('DOMContentLoaded', function () {
					const button = document.getElementById('pepsee-scan-button');
					const progress = document.getElementById('pepsee-scan-progress');
					const progressText = document.getElementById('pepsee-scan-progress-text');
					const progressBar = document.getElementById('pepsee-scan-progress-bar');

					if (!button || !progress || !progressText || !progressBar) {
						return;
					}

					button.addEventListener('click', async function () {
						let after = '';
						let carry = {};
						let processed = 0;
						const pageSize = 10;
						button.disabled = true;
						progress.style.display = 'block';
						progressText.textContent = '<?php echo esc_js( __( 'Connexion à Spotify…', 'pepsee-spotify-sync' ) ); ?>';
						progressBar.style.width = '5%';

						try {
							while (true) {
								const body = new URLSearchParams();
								body.append('action', 'pepsee_spotify_scan_step');
								body.append('_ajax_nonce', '<?php echo esc_js( wp_create_nonce( 'pepsee_spotify_scan_step' ) ); ?>');
								body.append('after', after);
								body.append('page_size', String(pageSize));
								body.append('carry', JSON.stringify(carry));

								const response = await fetch('<?php echo esc_url( admin_url( 'admin-ajax.php' ) ); ?>', {
									method: 'POST',
									headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
									body: body.toString()
								});
								const data = await response.json();

								if (!data.success) {
									throw new Error(data.data && data.data.message ? data.data.message : 'Scan impossible');
								}

								carry = data.data.carry || {};
								after = data.data.next_after || '';
								processed = carry.artists_processed || processed;
								const total = data.data.total || carry.followed_artists || processed || 1;
								const pct = Math.max(5, Math.min(100, Math.round((processed / total) * 100)));
								progressText.textContent = processed + ' / ' + total + ' artistes scannés';
								progressBar.style.width = pct + '%';

								if (data.data.done) {
									progressText.textContent = '<?php echo esc_js( __( 'Scan terminé, rechargement…', 'pepsee-spotify-sync' ) ); ?>';
									progressBar.style.width = '100%';
									window.location = '<?php echo esc_url( $this->admin_url( self::MENU_SLUG, array( 'result' => 'scan' ) ) ); ?>';
									return;
								}
							}
						} catch (error) {
							progressText.textContent = error.message || '<?php echo esc_js( __( 'Erreur pendant le scan.', 'pepsee-spotify-sync' ) ); ?>';
							button.disabled = false;
						}
					});

					document.addEventListener('click', function (event) {
						const removeButton = event.target.closest('[data-pepsee-remove-release]');

						if (!removeButton) {
							return;
						}

						event.preventDefault();
						const card = removeButton.closest('[data-pepsee-release-card]');

						if (card) {
							card.remove();
						}
					});
				});
			</script>

			<?php if ( ! empty( $current_result ) ) : ?>
				<h2><?php esc_html_e( 'Résultat courant', 'pepsee-spotify-sync' ); ?></h2>
				<?php $this->render_run_summary( $current_result ); ?>
			<?php endif; ?>

			<?php if ( empty( $current_result ) && ! empty( $last_scan ) ) : ?>
				<h2><?php esc_html_e( 'Dernier scan', 'pepsee-spotify-sync' ); ?></h2>
				<?php $this->render_run_summary( $last_scan ); ?>
			<?php endif; ?>
		</div>
		<?php
	}

	protected function admin_url( $page, array $args = array() ) {
		return add_query_arg(
			array_merge(
				array(
					'page' => $page,
				),
				$args
			),
			admin_url( 'admin.php' )
		);
	}

	protected function assert_manage_options() {
		if ( ! current_user_can( 'manage_options' ) ) {
			wp_die( esc_html__( 'Accès refusé.', 'pepsee-spotify-sync' ) );
		}
	}

	protected function redirect_with_notice( $page, $code, $message, array $extra_args = array() ) {
		wp_safe_redirect(
			$this->admin_url(
				$page,
				array_merge(
					array(
					'pepsee_notice' => sanitize_key( $code ),
					'message'       => rawurlencode( wp_strip_all_tags( (string) $message ) ),
					),
					$extra_args
				)
			)
		);
		exit;
	}

	protected function render_notice() {
		if ( empty( $_GET['pepsee_notice'] ) || empty( $_GET['message'] ) ) {
			return;
		}

		$code    = sanitize_key( wp_unslash( $_GET['pepsee_notice'] ) );
		$message = sanitize_text_field( rawurldecode( wp_unslash( $_GET['message'] ) ) );
		$class   = false !== strpos( $code, 'error' ) ? 'notice-error' : 'notice-success';
		?>
		<div class="notice <?php echo esc_attr( $class ); ?> is-dismissible"><p><?php echo esc_html( $message ); ?></p></div>
		<?php
	}

	protected function render_run_summary( array $result ) {
		$dry_run            = ! empty( $result['dry_run'] );
		$followed_artists   = isset( $result['followed_artists'] ) ? (int) $result['followed_artists'] : 0;
		$artists_processed  = isset( $result['artists_processed'] ) ? (int) $result['artists_processed'] : 0;
		$releases_found     = isset( $result['releases_found'] ) ? (int) $result['releases_found'] : 0;
		$releases_in_window = isset( $result['releases_in_window'] ) ? (int) $result['releases_in_window'] : 0;
		$releases_new       = isset( $result['releases_new'] ) ? (int) $result['releases_new'] : 0;
		$releases_existing  = isset( $result['releases_existing'] ) ? (int) $result['releases_existing'] : 0;
		$releases_seen      = isset( $result['releases_seen'] ) ? (int) $result['releases_seen'] : 0;
		$albums_created     = isset( $result['albums_created'] ) ? (int) $result['albums_created'] : 0;
		$albums_updated     = isset( $result['albums_updated'] ) ? (int) $result['albums_updated'] : 0;
		$tracks_created     = isset( $result['tracks_created'] ) ? (int) $result['tracks_created'] : 0;
		$tracks_updated     = isset( $result['tracks_updated'] ) ? (int) $result['tracks_updated'] : 0;
		$artists_saved      = isset( $result['source_artists_saved'] ) ? (int) $result['source_artists_saved'] : 0;
		$error_count        = ! empty( $result['errors'] ) && is_array( $result['errors'] ) ? count( $result['errors'] ) : 0;
		$release_preview    = ! empty( $result['release_preview'] ) && is_array( $result['release_preview'] ) ? $result['release_preview'] : array();
		$preview_page       = isset( $_GET['preview_page'] ) ? max( 1, absint( $_GET['preview_page'] ) ) : 1;
		$preview_new_only   = ! empty( $_GET['preview_new_only'] );
		$preview_existing_only = ! empty( $_GET['preview_existing_only'] );
		$preview_per_page   = 30;

		if ( $preview_new_only ) {
			$release_preview = array_values(
				array_filter(
					$release_preview,
					function( $release ) {
						return ! empty( $release['is_new'] );
					}
				)
			);
		} elseif ( $preview_existing_only ) {
			$release_preview = array_values(
				array_filter(
					$release_preview,
					function( $release ) {
						return ! empty( $release['in_wp'] );
					}
				)
			);
		}

		$preview_total      = count( $release_preview );
		$preview_pages      = max( 1, (int) ceil( $preview_total / $preview_per_page ) );

		if ( $preview_page > $preview_pages ) {
			$preview_page = $preview_pages;
		}

		$release_preview_page = array_slice( $release_preview, ( $preview_page - 1 ) * $preview_per_page, $preview_per_page );
		?>
		<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:12px;margin:12px 0 16px;">
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php esc_html_e( 'Mode', 'pepsee-spotify-sync' ); ?></strong><br>
				<span><?php echo esc_html( $dry_run ? __( 'Scan 7 jours', 'pepsee-spotify-sync' ) : __( 'Import drafts', 'pepsee-spotify-sync' ) ); ?></span>
			</div>
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php esc_html_e( 'Artistes suivis', 'pepsee-spotify-sync' ); ?></strong><br>
				<span><?php echo esc_html( $followed_artists ); ?></span>
			</div>
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php echo esc_html( $dry_run ? __( 'Artistes scannés', 'pepsee-spotify-sync' ) : __( 'Artistes traités', 'pepsee-spotify-sync' ) ); ?></strong><br>
				<span><?php echo esc_html( $artists_processed ); ?></span>
			</div>
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php esc_html_e( 'Releases trouvées', 'pepsee-spotify-sync' ); ?></strong><br>
				<span><?php echo esc_html( $releases_found ); ?></span>
			</div>
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php esc_html_e( 'Releases dans la fenêtre', 'pepsee-spotify-sync' ); ?></strong><br>
				<span><?php echo esc_html( $releases_in_window ); ?></span>
			</div>
			<?php if ( $dry_run ) : ?>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Releases inédites', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( $releases_new ); ?></span>
				</div>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Releases déjà connues', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( $releases_existing ); ?></span>
				</div>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Releases déjà vues', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( $releases_seen ); ?></span>
				</div>
			<?php endif; ?>
			<?php if ( ! $dry_run ) : ?>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Artists créés', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( $artists_saved ); ?></span>
				</div>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Albums', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( sprintf( __( '%1$d créés / %2$d mis à jour', 'pepsee-spotify-sync' ), $albums_created, $albums_updated ) ); ?></span>
				</div>
				<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
					<strong><?php esc_html_e( 'Tracks', 'pepsee-spotify-sync' ); ?></strong><br>
					<span><?php echo esc_html( sprintf( __( '%1$d créés / %2$d mis à jour', 'pepsee-spotify-sync' ), $tracks_created, $tracks_updated ) ); ?></span>
				</div>
			<?php endif; ?>
			<div style="padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:6px;">
				<strong><?php esc_html_e( 'Erreurs', 'pepsee-spotify-sync' ); ?></strong><br>
				<span><?php echo esc_html( $error_count ); ?></span>
			</div>
		</div>
		<?php if ( $error_count ) : ?>
			<div class="notice notice-warning inline"><p><?php echo esc_html( sprintf( __( '%d erreur(s) détectée(s) pendant cette exécution. Regarde le JSON ou les logs pour le détail.', 'pepsee-spotify-sync' ), $error_count ) ); ?></p></div>
		<?php endif; ?>
		<?php if ( $dry_run && ! empty( $release_preview ) ) : ?>
			<div style="display:flex;justify-content:space-between;gap:12px;align-items:end;flex-wrap:wrap;margin:18px 0 12px;">
				<div>
					<h3 style="margin:0 0 4px;"><?php esc_html_e( 'Aperçu des releases détectées', 'pepsee-spotify-sync' ); ?></h3>
					<p style="margin:0;color:#50575e;">
						<?php
						echo esc_html(
							sprintf(
								/* translators: 1: current page, 2: total pages, 3: total items */
								__( 'Page %1$d sur %2$d, %3$d releases dans cet aperçu.', 'pepsee-spotify-sync' ),
								$preview_page,
								$preview_pages,
								$preview_total
							)
						);
						?>
					</p>
				</div>
				<div style="display:flex;gap:8px;align-items:center;flex-wrap:wrap;">
					<a class="button <?php echo ( ! $preview_new_only && ! $preview_existing_only ) ? 'button-primary' : ''; ?>" href="<?php echo esc_url( add_query_arg( array( 'preview_new_only' => 0, 'preview_existing_only' => 0, 'preview_page' => 1 ) ) ); ?>"><?php esc_html_e( 'Toutes', 'pepsee-spotify-sync' ); ?></a>
					<a class="button <?php echo $preview_new_only ? 'button-primary' : ''; ?>" href="<?php echo esc_url( add_query_arg( array( 'preview_new_only' => 1, 'preview_existing_only' => 0, 'preview_page' => 1 ) ) ); ?>"><?php esc_html_e( 'Inédites seulement', 'pepsee-spotify-sync' ); ?></a>
					<a class="button <?php echo $preview_existing_only ? 'button-primary' : ''; ?>" href="<?php echo esc_url( add_query_arg( array( 'preview_new_only' => 0, 'preview_existing_only' => 1, 'preview_page' => 1 ) ) ); ?>"><?php esc_html_e( 'Déjà dans WP seulement', 'pepsee-spotify-sync' ); ?></a>
				</div>
				<?php if ( $preview_pages > 1 ) : ?>
					<div style="display:flex;gap:8px;align-items:center;flex-wrap:wrap;">
						<?php if ( $preview_page > 1 ) : ?>
							<a class="button" href="<?php echo esc_url( add_query_arg( array( 'preview_page' => $preview_page - 1, 'preview_new_only' => $preview_new_only ? 1 : 0, 'preview_existing_only' => $preview_existing_only ? 1 : 0 ) ) ); ?>"><?php esc_html_e( 'Previous', 'pepsee-spotify-sync' ); ?></a>
						<?php endif; ?>
						<span><?php echo esc_html( sprintf( __( 'Page %1$d / %2$d', 'pepsee-spotify-sync' ), $preview_page, $preview_pages ) ); ?></span>
						<?php if ( $preview_page < $preview_pages ) : ?>
							<a class="button" href="<?php echo esc_url( add_query_arg( array( 'preview_page' => $preview_page + 1, 'preview_new_only' => $preview_new_only ? 1 : 0, 'preview_existing_only' => $preview_existing_only ? 1 : 0 ) ) ); ?>"><?php esc_html_e( 'Next', 'pepsee-spotify-sync' ); ?></a>
						<?php endif; ?>
					</div>
				<?php endif; ?>
			</div>
			<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:14px;margin:12px 0 18px;">
				<?php foreach ( $release_preview_page as $release ) : ?>
					<div data-pepsee-release-card style="display:grid;grid-template-columns:72px minmax(0,1fr);gap:12px;padding:12px;border:1px solid #dcdcde;background:#fff;border-radius:10px;align-items:start;">
						<div>
							<?php if ( ! empty( $release['image_url'] ) ) : ?>
								<img src="<?php echo esc_url( $release['image_url'] ); ?>" alt="" referrerpolicy="no-referrer" loading="lazy" style="display:block;width:72px;height:72px;object-fit:cover;border-radius:8px;">
							<?php else : ?>
								<div style="width:72px;height:72px;background:#f0f0f1;border-radius:8px;"></div>
							<?php endif; ?>
						</div>
						<div style="min-width:0;">
							<div style="display:flex;justify-content:space-between;gap:8px;align-items:start;margin-bottom:6px;">
								<strong style="font-size:14px;line-height:1.4;"><?php echo esc_html( isset( $release['name'] ) ? $release['name'] : '' ); ?></strong>
								<?php if ( ! empty( $release['in_wp'] ) ) : ?>
									<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#6b7280;color:#fff;font-size:12px;white-space:nowrap;"><?php esc_html_e( 'Déjà dans WP', 'pepsee-spotify-sync' ); ?></span>
								<?php elseif ( ! empty( $release['seen_before'] ) ) : ?>
									<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#b45309;color:#fff;font-size:12px;white-space:nowrap;"><?php esc_html_e( 'Déjà vu', 'pepsee-spotify-sync' ); ?></span>
								<?php elseif ( ! empty( $release['is_new'] ) ) : ?>
									<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#15803d;color:#fff;font-size:12px;white-space:nowrap;"><?php esc_html_e( 'Inédite', 'pepsee-spotify-sync' ); ?></span>
								<?php else : ?>
									<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#6b7280;color:#fff;font-size:12px;white-space:nowrap;"><?php esc_html_e( 'Déjà dans WP', 'pepsee-spotify-sync' ); ?></span>
								<?php endif; ?>
							</div>
							<div style="color:#50575e;margin-bottom:8px;"><?php echo esc_html( isset( $release['artist_name'] ) ? $release['artist_name'] : '' ); ?></div>
							<div style="display:flex;gap:6px;flex-wrap:wrap;margin-bottom:8px;">
								<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#f6f7f7;color:#1d2327;font-size:12px;"><?php echo esc_html( isset( $release['release_date'] ) ? $release['release_date'] : '' ); ?></span>
								<span style="display:inline-block;padding:2px 8px;border-radius:999px;background:#f6f7f7;color:#1d2327;font-size:12px;"><?php echo esc_html( trim( ( isset( $release['album_group'] ) ? $release['album_group'] : '' ) . ' ' . ( isset( $release['album_type'] ) ? '(' . $release['album_type'] . ')' : '' ) ) ); ?></span>
							</div>
							<div style="display:flex;gap:10px;flex-wrap:wrap;align-items:center;">
								<?php if ( ! empty( $release['spotify_url'] ) ) : ?>
									<a href="<?php echo esc_url( $release['spotify_url'] ); ?>" target="_blank" rel="noopener noreferrer"><?php esc_html_e( 'Ouvrir sur Spotify', 'pepsee-spotify-sync' ); ?></a>
								<?php endif; ?>
								<form method="get" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>" target="_blank" rel="noopener noreferrer" style="margin:0;">
									<input type="hidden" name="action" value="pepsee_spotify_view_release_json">
									<input type="hidden" name="release_id" value="<?php echo esc_attr( isset( $release['id'] ) ? $release['id'] : '' ); ?>">
									<?php wp_nonce_field( 'pepsee_spotify_view_release_json' ); ?>
									<button type="submit" class="button button-small"><?php esc_html_e( 'Voir JSON Spotify', 'pepsee-spotify-sync' ); ?></button>
								</form>
								<?php if ( empty( $release['in_wp'] ) ) : ?>
									<form method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>" target="_blank" rel="noopener noreferrer" style="margin:0;">
										<input type="hidden" name="action" value="pepsee_spotify_import_single_release">
										<input type="hidden" name="release_id" value="<?php echo esc_attr( isset( $release['id'] ) ? $release['id'] : '' ); ?>">
										<?php wp_nonce_field( 'pepsee_spotify_import_single_release' ); ?>
										<button type="submit" class="button button-small"><?php esc_html_e( 'Créer ce draft', 'pepsee-spotify-sync' ); ?></button>
									</form>
									<?php if ( isset( $release['album_type'] ) && 'single' === $release['album_type'] ) : ?>
										<a class="button button-small" target="_blank" rel="noopener noreferrer" href="<?php echo esc_url( $this->admin_url( self::MENU_SLUG, array( 'view' => 'merge_release', 'release_id' => isset( $release['id'] ) ? $release['id'] : '' ) ) ); ?>"><?php esc_html_e( 'Compléter un post', 'pepsee-spotify-sync' ); ?></a>
									<?php endif; ?>
								<?php else : ?>
									<span class="button button-small disabled" aria-disabled="true"><?php esc_html_e( 'Déjà dans WP', 'pepsee-spotify-sync' ); ?></span>
								<?php endif; ?>
								<button type="button" class="button button-small" data-pepsee-remove-release="1"><?php esc_html_e( 'Retirer', 'pepsee-spotify-sync' ); ?></button>
							</div>
						</div>
					</div>
				<?php endforeach; ?>
			</div>
		<?php endif; ?>
		<?php
	}

	protected function render_merge_release_page() {
		$release_id = isset( $_GET['release_id'] ) ? sanitize_text_field( wp_unslash( $_GET['release_id'] ) ) : '';
		$search     = isset( $_GET['merge_search'] ) ? sanitize_text_field( wp_unslash( $_GET['merge_search'] ) ) : '';
		$release    = $this->service->get_release_details( $release_id );

		?>
		<div class="wrap">
			<h1><?php esc_html_e( 'Compléter un post existant', 'pepsee-spotify-sync' ); ?></h1>
			<?php $this->render_notice(); ?>
			<p><a href="<?php echo esc_url( $this->admin_url( self::MENU_SLUG ) ); ?>">&larr; <?php esc_html_e( 'Retour au scan', 'pepsee-spotify-sync' ); ?></a></p>
			<?php if ( is_wp_error( $release ) ) : ?>
				<div class="notice notice-error"><p><?php echo esc_html( $release->get_error_message() ); ?></p></div>
			<?php else : ?>
				<?php
				$target_post_type = $this->service->get_release_target_post_type( $release );
				if ( 'music' !== $target_post_type ) {
					echo '<div class="notice notice-warning inline"><p>' . esc_html__( 'Le complément d’un post existant est disponible uniquement pour les singles.', 'pepsee-spotify-sync' ) . '</p></div></div>';
					return;
				}
				$default_search   = ! empty( $release['name'] ) ? (string) $release['name'] : '';
				$posts            = $this->repository->search_posts_for_merge( $target_post_type, '' !== $search ? $search : $default_search, 20 );
				$artist_names     = implode( ' x ', wp_list_pluck( isset( $release['artists'] ) ? (array) $release['artists'] : array(), 'name' ) );
				?>
				<div style="display:grid;grid-template-columns:96px minmax(0,1fr);gap:16px;max-width:860px;padding:16px;border:1px solid #dcdcde;background:#fff;border-radius:10px;margin:16px 0;">
					<div>
						<?php if ( ! empty( $release['images'][0]['url'] ) ) : ?>
							<img src="<?php echo esc_url( $release['images'][0]['url'] ); ?>" alt="" style="display:block;width:96px;height:96px;object-fit:cover;border-radius:10px;">
						<?php endif; ?>
					</div>
					<div>
						<h2 style="margin:0 0 6px;"><?php echo esc_html( $default_search ); ?></h2>
						<p style="margin:0 0 8px;color:#50575e;"><?php echo esc_html( $artist_names ); ?></p>
						<p style="margin:0;"><span class="button button-small disabled" aria-disabled="true"><?php echo esc_html( 'music' === $target_post_type ? __( 'Recherche dans les music', 'pepsee-spotify-sync' ) : __( 'Recherche dans les album', 'pepsee-spotify-sync' ) ); ?></span></p>
					</div>
				</div>
				<form method="get" action="<?php echo esc_url( admin_url( 'admin.php' ) ); ?>" style="margin:0 0 20px;">
					<input type="hidden" name="page" value="<?php echo esc_attr( self::MENU_SLUG ); ?>">
					<input type="hidden" name="view" value="merge_release">
					<input type="hidden" name="release_id" value="<?php echo esc_attr( $release_id ); ?>">
					<input type="search" name="merge_search" value="<?php echo esc_attr( $search ); ?>" placeholder="<?php esc_attr_e( 'Chercher un post existant', 'pepsee-spotify-sync' ); ?>" style="min-width:320px;">
					<button type="submit" class="button"><?php esc_html_e( 'Rechercher', 'pepsee-spotify-sync' ); ?></button>
				</form>
				<?php if ( empty( $posts ) ) : ?>
					<div class="notice notice-warning inline"><p><?php esc_html_e( 'Aucun post correspondant trouvé.', 'pepsee-spotify-sync' ); ?></p></div>
				<?php else : ?>
					<div style="display:grid;gap:12px;max-width:960px;">
						<?php foreach ( $posts as $post ) : ?>
							<div style="display:flex;justify-content:space-between;gap:16px;align-items:center;padding:12px 14px;border:1px solid #dcdcde;background:#fff;border-radius:8px;">
								<div style="min-width:0;">
									<strong><?php echo esc_html( get_the_title( $post ) ); ?></strong>
									<div style="color:#50575e;"><?php echo esc_html( $post->post_type . ' | ' . $post->post_status ); ?></div>
									<div style="margin-top:4px;">
										<a href="<?php echo esc_url( get_edit_post_link( $post->ID ) ); ?>" target="_blank" rel="noopener noreferrer"><?php esc_html_e( 'Edit post', 'pepsee-spotify-sync' ); ?></a>
										<?php if ( 'publish' === $post->post_status ) : ?>
											&nbsp;·&nbsp;<a href="<?php echo esc_url( get_permalink( $post ) ); ?>" target="_blank" rel="noopener noreferrer"><?php esc_html_e( 'Voir la page', 'pepsee-spotify-sync' ); ?></a>
										<?php endif; ?>
									</div>
								</div>
								<form method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>" style="margin:0;">
									<input type="hidden" name="action" value="pepsee_spotify_merge_into_post">
									<input type="hidden" name="release_id" value="<?php echo esc_attr( $release_id ); ?>">
									<input type="hidden" name="target_post_id" value="<?php echo esc_attr( $post->ID ); ?>">
									<?php wp_nonce_field( 'pepsee_spotify_merge_into_post' ); ?>
									<button type="submit" class="button button-primary"><?php esc_html_e( 'Compléter ce post', 'pepsee-spotify-sync' ); ?></button>
								</form>
							</div>
						<?php endforeach; ?>
					</div>
				<?php endif; ?>
			<?php endif; ?>
		</div>
		<?php
	}

}
