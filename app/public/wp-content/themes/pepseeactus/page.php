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
	the_title( '<h1 class="page-title">', '</h1>' ); ?>
<div class="page-content margin-outside">
	<?php the_content(); ?>
</div>

<?php endwhile; // End of the loop.

get_footer();