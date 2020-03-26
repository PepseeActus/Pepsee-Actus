<?php
/**
 * The template for displaying archive pages
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header(); ?>
		<?php
		if ( have_posts() ) : ?>

			<div class="archive-header">
				<h1>Nos derniers ajouts :</h1>
			</div>
			<?php
			/* Start the Loop */
			while ( have_posts() ) : the_post(); ?>
				<div class="post-item">
					<ul>
						<li>
							<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
						</li>
					</ul>
				</div>
			<?php endwhile;

			paginate_links();
			theme_pagination();

		else :

			get_template_part( 'components/post/content', 'none' );

		endif; ?>
<?php get_footer();
