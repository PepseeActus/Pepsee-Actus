<?php
if ( ! is_active_sidebar( 'sidebar-1' ) ) {
    return;
}
?>
<aside class="col-12 col-md-3 mobile-visually-hidden" role="complementary" aria-label="<?php esc_attr_e( 'Main widget area', 'pepseeactus' ); ?>">
    <section class="widget follow-us">
        <h3 class="widget-title">suivez-nous</h3>
        <div class="follow-us__box">
            <a class="facebook" href="https://www.facebook.com/PepseeActus/" target="_blank">
                <p class="icon"><i class="fab fa-facebook"></i><span>100K</span></p>
            </a>
            <a class="youtube" href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank">
                <p class="icon"><i class="fab fa-youtube"></i><span>25K</span></p>
            </a>
            <a class="instagram" href="https://www.instagram.com/pepseeactus/" target="_blank">
                <p class="icon"><i class="fab fa-instagram"></i><span>5K</span></p>
            </a>
            <a class="soundcloud" href="https://soundcloud.com/pepsee" target="_blank">
                <p class="icon"><i class="fab fa-soundcloud"></i><span>2K</span></p>
            </a>
        </div>
    </section>
    <?php dynamic_sidebar( 'sidebar-1' ); ?>
</aside>
