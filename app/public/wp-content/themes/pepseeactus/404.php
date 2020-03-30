<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
 *
 * @package PepseeActus
 */

get_header(); ?>
	<section class="error-404 not-found">
		<div class="page-header">
			<h2 class="page-title"><?php esc_html_e( "Oops! Cette page n'existe pas.", 'pepseeactus' ); ?></h2>
		</div>
		<div class="page-content">
			<?php the_widget( 'WP_Widget_Recent_Posts' ); ?>
		</div>
	</section>
<?php get_footer();
