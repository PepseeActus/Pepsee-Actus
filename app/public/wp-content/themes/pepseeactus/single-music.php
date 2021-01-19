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
                        <span class="entry-title name"><?= $artistes ?></span><br>
                        <span class="entry-title"><?= $titre ?></span>
                        <?= ($riddim) ? '<span class="entry-title riddim">'.$riddim.' Riddim</span>' : ''; ?>
                    </div>
                    <div class="music-presentation__info-reseaux">
                        <?php get_template_part( 'parts/link-template' ); ?>
                    </div>
                </div>
            </div>
            <div class="music-content">
                <div class="link">
                    <?php get_template_part( 'parts/download-template' ); ?>
                </div>
                <?php the_content(); ?>
                <div class="link">
                    <?php get_template_part( 'parts/stream-link-template' ); ?>
                </div>
            </div>
        </div>
        <aside class="col-12 col-md-3 padding-inside">
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
            <section class="artist-album">
                <?php $posts = get_field('artistes_associes');
                if ($posts): ?>
                    <h3 class="widget-title">Artiste<?= (count($posts) > 1) ? 's' : ''; ?> sur ce titre</h3>
                    <div class="artist-album__container">
                        <?php foreach ($posts as $post) {
                            $badge = get_field('compte_verifie'); ?>
                            
                            <div class="artist-album__container-box">
                                <div class="artist-image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="artist-info">
                                    <a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                    <?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
									<?php get_template_part( 'parts/reseaux-template' ); ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </section>
            <section class="related-album">
                <?php $posts = get_field('albums_associes');
                if ($posts): ?>
                    <h3 class="widget-title">Ce titre est présent sur</h3>
                    <div class="related-album__container">
                        <?php foreach ($posts as $post) { ?>
                            <div class="related-album__container-box">
                                <div class="related-album__image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="related-album__info">
                                    <a class="related-album__title" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                </div>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </section>
            <div class="instagram-feed mobile-visually-hidden">
                <?= do_shortcode("[instagram-feed]"); ?>
            </div>
        </aside>
    </div>
<?php endwhile; ?>

<?php
get_footer();