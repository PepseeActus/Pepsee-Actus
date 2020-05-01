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
		<h2>Les derniers ajouts :</h2>
	</div>
	<?php
	/* Start the Loop */
	while ( have_posts() ) : the_post(); ?>
		<div class="post-item">
			<ul>
				<li>
					<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
					<h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
					<?php if (site_url('/actus')) { ?>
						<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();}
					} ?>
				</li>
			</ul>
		</div>
	<?php endwhile;

	paginate_links();
	theme_pagination();
endif;

get_footer();
