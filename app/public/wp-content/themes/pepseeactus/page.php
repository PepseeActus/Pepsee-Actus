<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header(); ?>

<?php 
while ( have_posts() ) : the_post();
	$theParent = wp_get_post_parent_id(get_the_ID());

	if ($theParent) : ?>
		<div class="page-nav">
			<p>
				<a href="<?= get_permalink($theParent); ?>" class="home-link"><i class="fa fa-home" aria-hidden="true"></i> Retour sur <?= get_the_title($theParent); ?></a>
				<span><?php the_title(); ?></span>
			</p>
		</div>
	<?php endif; ?>
	<?php the_title( '<h2 class="page-title">', '</h2>' ); ?>
	<div class="row">
		<div class="page-content col">
			<?php the_content(); ?>
		</div>
		<aside class="col-12 col-md-3">
			<?php 
			$testArray = get_pages([
				'child_of' => get_the_ID()
			]);

			if ($theparent or $testArray) : ?>
				<div class="page-link">
					<ul>
						<?php
							if ($theParent) {
								$findChildrenOf = $theParent;
							} else {
								$findChildrenOf = get_the_ID();
							}

							wp_list_pages([
								'title_li' => NULL,
								'child_of' => $findChildrenOf,
								'sort_column' => 'menu_order'
							]);
						?>
					</ul>
				</div>
			<?php endif; ?>
		</aside>
	</div>

<?php endwhile; // End of the loop.

get_footer();
