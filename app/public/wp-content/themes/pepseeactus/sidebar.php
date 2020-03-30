<?php
if ( ! is_active_sidebar( 'sidebar-1' ) ) {
    return;
}
?>
<aside class="col-12 col-md-3 padding-inside" role="complementary" aria-label="<?php esc_attr_e( 'Main widget area', 'pepseeactus' ); ?>">
    <?php dynamic_sidebar( 'sidebar-1' ); ?>
</aside>
