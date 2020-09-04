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
            <form id="pepsee_filters" action="#">
                <label for="pepsee_number_of_results">Per page</label>
                <select name="pepsee_number_of_results" id="pepsee_number_of_results">
                    <option><?php echo get_option( 'posts_per_page' ) ?></option><!-- it is from Settings > Reading -->
                    <option>5</option>
                    <option>10</option>
                    <option value="-1">All</option>
                </select>

                <label for="pepsee_year">Son de quelle année ?</label>
                <select name="pepsee_year" id="pepsee_year">
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

                <label for="pepsee_order_by">Order</label>
                <select name="pepsee_order_by" id="pepsee_order_by">
                    <option value="date-DESC">Date ↓</option><!-- I will explode these values by "-" symbol later -->
                    <option value="date-ASC">Date ↑</option>
                    <option value="comment_count-DESC">Comments ↓</option>
                    <option value="comment_count-ASC">Comments ↑</option>
                </select>

                <input type="hidden" name="action" value="pepseefilter" />

                <button>Apply Filters</button>
            </form>

            <div id="pepsee_posts_wrap" class="row"></div>

            <?php 
            if (  $wp_query->max_num_pages > 1 ) : ?>
                <div id="pepsee_loadmore">More posts</div>
            <?php endif; ?>
        </div>
		<?php get_sidebar(); ?>
    </div>

<?php endif;?>

<?php get_footer();
