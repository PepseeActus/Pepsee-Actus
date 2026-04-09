<?php
if ( ! is_active_sidebar( 'sidebar-1' ) ) {
    return;
}
?>
<aside class="col-12 col-md-3 mobile-visually-hidden" role="complementary" aria-label="<?php esc_attr_e( 'Main widget area', 'pepseeactus' ); ?>">
    <?php get_template_part( 'parts/social-stat' ); ?>
    <?php dynamic_sidebar( 'sidebar-1' ); ?>
    <?php get_template_part( 'parts/sidebar-stat' ); ?>
</aside>
