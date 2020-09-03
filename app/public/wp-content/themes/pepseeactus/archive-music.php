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
            <div class="select-year">
                <span>Son de quelle année ?</span>
                <select name="year" id="sort">
                    <?php
                        $previous_letter = null; 
                        /* Start the Loop */
                        while ( have_posts() ) : the_post();
                            $glossary_letter = get_the_date('Y');

                            if ( $glossary_letter !== $previous_letter ): ?>
                                <option value="<?= get_the_date('Y'); ?>"><?= get_the_date('Y'); ?></option>
                            <?php endif;
                                
                            $previous_letter = $glossary_letter;
                        endwhile; ?>
                </select>
            </div>

            <div class="blog-posts row">
                <?php
                /* Start the Loop */
                $args = [
                    'posts_per_page' => 4,
                    'orderby' => 'date',
                    'post_type' => 'music',
                    'year' => date("Y"),
                    'paged' => 1
                ];
                $blog_posts = new WP_Query( $args );
                ?>

                <?php while ( $blog_posts->have_posts() ) : $blog_posts->the_post(); ?>
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
                                    <?php the_date('M Y') ?>
                                </div>
                            </li>
                        </ul>
                    </div>
                <?php endwhile; ?>
            </div>

            <div class="loadmore col-12">
                <button>Voir plus</button>
            </div>
        </div>
		<?php get_sidebar(); ?>
    </div>
<?php endif;?>

<?php get_footer();
