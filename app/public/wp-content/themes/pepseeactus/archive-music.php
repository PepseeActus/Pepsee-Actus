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
        <h2>Musique</h2>
    </div>
    <div class="wrapper row padding-inside">
        <div class="principal col-12 col-lg-9 padding-inside">
            <form id="pepsee_filters" action="#">
                <select name="pepsee_number_of_results" id="pepsee_number_of_results">
                    <option value="<?= get_option( 'posts_per_page' ) ?>" disabled selected>Nombre de sons</option>
                    <option>5</option>
                    <option>10</option>
                    <option>20</option>
                    <option value="-1">All</option>
                </select>

                <select name="pepsee_year" id="pepsee_year">
                    <option value="<?= date('Y') ?>" disabled selected>Année</option>
                    <?php
                    // Sets the top option to be the current year. (IE. the option that is chosen by default).
                    $currently_selected = date('Y'); 
                    // Year to start available options at
                    $earliest_year = 1997; 
                    // Set your latest year you want in the range, in this case we use PHP to just set it to the current year.
                    $latest_year = date('Y'); 

                    // Loops over each int[year] from current year, back to the $earliest_year [1950]
                    foreach ( range( $latest_year, $earliest_year ) as $i ) {
                        // Prints the option with the next year in range.
                        print '<option value="'.$i.'"'.($i === $currently_selected ? ' selected="selected"' : '').'>'.$i.'</option>';
                    }
                    ?>
                </select>

                <select name="pepsee_order_by" id="pepsee_order_by">
                    <option value="date-DESC">Date ↓</option><!-- I will explode these values by "-" symbol later -->
                    <option value="date-ASC">Date ↑</option>
                </select>

                <input type="hidden" name="action" value="pepseefilter" />

            </form>

            <div id="pepsee_posts_wrap" class="row">
                <?php
                /* Start the Loop */
                $args = [
                    'posts_per_page' => 4,
                    'orderby' => 'date',
                    'post_type' => array('music', 'album'),
                    'year' => date("Y"),
                    'paged' => 1
                ];
                $blog_posts = new WP_Query( $args );
                ?>

                <?php while ( $blog_posts->have_posts() ) : $blog_posts->the_post(); ?>
                    <div class="post-item col-12 col-md-6">
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
                    </div>
                <?php endwhile; ?>
            </div>

            <?php if (  $wp_query->max_num_pages > 1 ) : ?>
                <div id="pepsee_loadmore">Plus de sons</div>
            <?php endif; ?>
        </div>
		<?php get_sidebar(); ?>
    </div>

<?php endif;?>

<?php get_footer();
