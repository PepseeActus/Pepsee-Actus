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
                <label for="pepsee_number_of_results">Nombre de sons</label>
                <select name="pepsee_number_of_results" id="pepsee_number_of_results">
                    <option><?php echo get_option( 'posts_per_page' ) ?></option><!-- it is from Settings > Reading -->
                    <option>5</option>
                    <option>10</option>
                    <option value="-1">All</option>
                </select>

                <label for="pepsee_year">Son de quelle année ?</label>
                <select name="pepsee_year" id="pepsee_year">
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

                <label for="pepsee_order_by">Quel ordre</label>
                <select name="pepsee_order_by" id="pepsee_order_by">
                    <option value="date-DESC">Date ↓</option><!-- I will explode these values by "-" symbol later -->
                    <option value="date-ASC">Date ↑</option>
                </select>

                <input type="hidden" name="action" value="pepseefilter" />

                <button>Apply Filters</button>
            </form>

            <div id="pepsee_posts_wrap" class="row"></div>

            <?php if (  $wp_query->max_num_pages > 1 ) : ?>
                <div id="pepsee_loadmore">Plus de sons</div>
            <?php endif; ?>
        </div>
		<?php get_sidebar(); ?>
    </div>

<?php endif;?>

<?php get_footer();
