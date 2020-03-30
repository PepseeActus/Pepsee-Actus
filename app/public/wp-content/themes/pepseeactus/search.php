<?php
/**
 * The template for displaying search results pages
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#search-result
 *
 * @package PepseeActus
 */

get_header(); ?>
<section class="content-area padding-inside">
	<?php
	if ( have_posts() ) : ?>

		<div class="page-header">
			<h2 class="page-title"><?php printf( esc_html__( 'Les résultats pour: %s', 'pepseeactus' ), '<span>' . get_search_query() . '</span>' ); ?></h2>
		</div>
		<?php while ( have_posts() ) : the_post(); ?>
			<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
				<div class="entry-header">
					<?php the_title( sprintf( '<h3 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h3>' ); ?>
				</div>
				<div class="entry-summary">
					<?php the_excerpt(); ?>
				</div>
			</article>
		<?php endwhile;
		the_posts_navigation();

	else : ?>

		<section class="no-results not-found">
		<div class="page-header">
			<h2 class="page-title"><?php esc_html_e( 'Rien trouvé', 'pepseeactus' ); ?></h2>
		</div>
		<div class="page-content">
			<p><?php esc_html_e( 'Désolé mais votre rechecherche ne remonte aucun résultat.', 'pepseeactus' ); ?></p>
		</div>
	</section>
	<?php endif; ?>
</section>
<?php get_footer();
