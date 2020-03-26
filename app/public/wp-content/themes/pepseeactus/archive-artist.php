<?php
/**
 * The template for displaying archive pages
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header(); ?>
<h2>Tous les artistes</h2>
<?= do_shortcode("[list_glossary_posts]"); ?>
<?php get_footer();