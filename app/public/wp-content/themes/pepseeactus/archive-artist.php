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
<div class="padding-inside">
    <div class="principal">
        <?= do_shortcode("[list_glossary_posts]"); ?>
    </div>
</div>
<?php get_footer();