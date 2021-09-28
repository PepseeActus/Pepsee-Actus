<?php
/**
 * The template for displaying archive pages
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header();
?>

<h2>Riddims</h2>
<div class="padding-inside">
    <div class="principal">
        <?php
        $yearly = new WP_Query([
            'posts_per_page' => -1,
            'post_type' => 'riddim',
            'orderby'=> 'date',
            'order' => 'ASC'
        ]);
        $prev_year = null;
        if( $yearly->have_posts() ) : while( $yearly->have_posts() ) : $yearly->the_post();
            $this_year = get_the_date('Y');

            if ($prev_year != $this_year) {
                if (!is_null($prev_year)) {
                    echo '</div>';
                }
                echo '<div class="group">';
                echo '<h3 class="letter">' . $this_year . '</h3>';
            }
            echo '<div class="bloc-letter"><a href=' . get_the_permalink() . '>' . get_the_title();
            echo '</a></div>';
            $prev_year = $this_year;

            endwhile;    
            echo '</div>';
        endif;
        ?>
    </div>
</div>

<?php
get_footer();