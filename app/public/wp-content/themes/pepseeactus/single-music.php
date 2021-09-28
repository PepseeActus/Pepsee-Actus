<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package PepseeActus
 */

get_header();

while ( have_posts() ) : the_post(); ?>
    <?php 
        $artistes = get_field('artistes');
        $titre = get_field('titre');
        $riddim = get_field('riddim');
    ?>
    
    <div class="row">
        <div id="post-<?php the_ID(); ?>" <?php post_class('col-12 col-md-9'); ?>>
            <div class="music-presentation">
                <div class="music-presentation__picture rotate">
                    <?php the_post_thumbnail('thumbnail'); ?>
                </div>
                <div class="music-presentation__info">
                    <div class="music-presentation__info-name">
                        <span class="entry-title name"><?= wp_trim_words( $artistes, 12, '...' ); ?></span><br>
                        <span class="entry-title"><?= $titre ?></span>
                        <?= ($riddim) ? '<span class="entry-title riddim">'.$riddim.' Riddim</span>' : ''; ?>
                        <div>
                            <?php $beatmakers = get_field('beatmaker');
                            if ($beatmakers): ?>
                                <div>
                                    <?php foreach ($beatmakers as $beatmaker) { ?>
                                        <a href="<?= get_the_permalink($beatmaker); ?>">Beatmaker : <b><?= get_the_title($beatmaker); ?></b></a>
                                    <?php } ?>
                                    <?php wp_reset_postdata(); ?>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <section class="related-album">
                        <?php $posts = get_field('albums_associes');
                        if ($posts): ?>
                            <?php foreach ($posts as $post) { ?>
                                <p>Album: <a class="related-album__title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a></p>
                            <?php } ?>
                            <?php wp_reset_postdata(); ?>
                        <?php endif; ?>
                    </section>
                </div>
            </div>
            <div class="music-content">
                <div class="link">
                    <?php get_template_part( 'parts/stream-link-template' ); ?>
                </div>
                <section class="artist-album">
                    <?php $posts = get_field('artistes_associes');
                    if ($posts): ?>
                        <div class="artist-image__container">
                            <?php foreach ($posts as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="artist-image">
                                        <a href="<?= get_the_permalink($post); ?>">
                                            <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                        </a>
                                    </div>
                            <?php } ?>
                            <?php wp_reset_postdata(); ?>
                        </div>
                    <?php endif;
                    if ($posts): ?>
                        <div class="artist-info__container">
                            <?php foreach ($posts as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="artist-info">
                                        <a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                        <?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
                                    </div>
                            <?php } ?>
                            <?php wp_reset_postdata(); ?>
                        </div>
                    <?php endif; ?>
                </section>
                <?php the_content(); ?>
            </div>
        </div>
        <aside class="col-12 col-md-3 padding-inside">
            <div class="une">
                <h3 class="widget-title">À la une</h3>
                <?= do_shortcode("[pissc number=3 display_image=1 image_size='post-thumbnail' excerpt=none title_length=70 title_length_unit='chars' title_hellipsis=1]"); ?>
            </div>
            <section class="widget follow-us">
                <h3 class="widget-title">suivez-nous</h3>
                <div class="follow-us__box">
                    <a class="facebook" href="https://www.facebook.com/PepseeActus/" target="_blank">
                        <p class="icon"><i class="fab fa-facebook"></i><span>103K</span></p>
                    </a>
                    <a class="youtube" href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank">
                        <p class="icon"><i class="fab fa-youtube"></i><span>30K</span></p>
                    </a>
                    <a class="instagram" href="https://www.instagram.com/pepseeactus/" target="_blank">
                        <p class="icon"><i class="fab fa-instagram"></i><span>5K</span></p>
                    </a>
                    <a class="soundcloud" href="https://soundcloud.com/pepsee" target="_blank">
                        <p class="icon"><i class="fab fa-soundcloud"></i><span>2K</span></p>
                    </a>
                </div>
            </section>
            <div class="instagram-feed mobile-visually-hidden">
                <?= do_shortcode("[instagram-feed]"); ?>
            </div>
            <div class="share">
                <?= do_shortcode("[scriptless buttons='facebook,twitter,whatsapp,pinterest,linkedin,email']"); ?>
            </div>
        </aside>
    </div>
<?php endwhile; ?>

<?php
get_footer();