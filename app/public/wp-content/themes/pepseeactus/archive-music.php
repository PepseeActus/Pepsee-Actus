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
        <h2>Les derniers ajouts</h2>
    </div>
    <div class="wrapper row padding-inside">
        <div class="principal col-12 col-lg-9 padding-inside">
            <div class="row">
                <?php
                /* Start the Loop */
                while ( have_posts() ) : the_post(); ?>
                    <div class="post-item col-12 col-md-6">
                        <ul>
                            <li>
                                <?php
                                $artistes = get_field('artistes');
                                $titre = get_field('titre');
                                ?>
                                <a class="rotate" href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
                                <div>
                                    <a href="<?php the_permalink(); ?>"><?= $artistes; ?></a>
                                    <a href="<?php the_permalink(); ?>"><?= $titre; ?></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
		<?php get_sidebar(); ?>
    </div>
    <?php
    paginate_links();
    theme_pagination();
endif;

get_footer();
