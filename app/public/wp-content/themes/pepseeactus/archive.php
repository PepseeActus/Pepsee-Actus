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
								<div class="post-meta">
									<svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg>
									<?php echo meks_time_ago(); ?>
									<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();} ?>
								</div>
								<?php the_excerpt(); ?>
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
