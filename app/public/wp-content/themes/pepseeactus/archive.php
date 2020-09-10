<?php
/**
 * The template for displaying archive pages
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header();

if ( have_posts() ) : ?>

	<div class="archive-header">
		<h2><?= get_the_archive_title(); ?></h2>
	</div>
	<div class="wrapper row padding-inside">
		<div class="principal col-12 col-lg-9 padding-inside">
			<?php
			/* Start the Loop */
			while ( have_posts() ) : the_post(); ?>
				<div class="post-item">
					<ul>
						<li>
							<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('large'); ?></a>
							<div>
								<a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
								<?php the_excerpt(); ?>
								<div class="post-meta">
									<?php echo meks_time_ago(); ?>
									<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();} ?>
								</div>
							</div>
						</li>
					</ul>
				</div>
			<?php endwhile; ?>
		</div>
		<?php get_sidebar(); ?>
	</div>

	<?php
	paginate_links();
	theme_pagination();
endif;

get_footer();
