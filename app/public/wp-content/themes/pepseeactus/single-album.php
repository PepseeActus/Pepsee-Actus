<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package PepseeActus
 */

get_header(); ?>

<?php while ( have_posts() ) : the_post(); ?>
<div class="row">
    <div id="post-<?php the_ID(); ?>" <?php post_class('col-12 col-md-9'); ?>>
        <?php 
                $artistes = get_field('artistes');
                $titre = get_field('titre');
                $download = get_field('download');
                $backlink = get_field('backlink');
                $soundcloud = get_field('soundcloud');
                $youtube = get_field('youtube');
                $spotify = get_field('spotify');
                $deezer = get_field('deezer');
                $apple = get_field('apple_music'); 
            ?>
        <div class="music-presentation">
            <div class="music-presentation__picture">
                <?php the_post_thumbnail('thumbnail'); ?>
            </div>
            <div class="music-presentation__info">
                <div class="music-presentation__info-name">
                    <span class="entry-title"><?= $artistes ?></span><br>
                    <span class="entry-title"><?= $titre ?></span>
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
    <aside class="col-12 col-md-3">
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
        <section class="widget instagram-feed">
            <?= do_shortcode("[instagram-feed]"); ?>
        </section>
        <section class="artist-album">
            <?php $posts = get_field('artistes_associes');
                if ($posts): ?>
            <h3 class="widget-title">Artiste<?= (count($posts) > 1) ? 's' : ''; ?> sur cet album</h3>
            <div class="artist-album__container">
                <?php foreach ($posts as $post) {
                            $badge = get_field('compte_verifie');
                            $twitter = get_field('twitter');
                            $facebook = get_field('facebook');
                            $instagram = get_field('instagram');
                            $youtube = get_field('youtube'); ?>

                <div class="artist-album__container-box">
                    <div class="artist-image">
                        <a href="<?= get_the_permalink($post); ?>">
                            <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>"
                                alt="<?= get_the_title($post); ?>">
                        </a>
                    </div>
                    <div class="artist-info">
                        <a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
                        <?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
                        <ul>
                            <?= ($twitter) ? '<li><a href="'.$twitter.'" target="_blank"><i class="fab fa-twitter"></i></a></li>' : ''; ?>
                            <?= ($instagram) ? '<li><a href="'.$instagram.'" target="_blank"><i class="fab fa-instagram"></i></a></li>' : ''; ?>
                            <?= ($facebook) ? '<li><a href="'.$facebook.'" target="_blank"><i class="fab fa-facebook-f"></i></a></li>' : ''; ?>
                            <?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><i class="fab fa-youtube"></i></a></li>' : ''; ?>
                        </ul>
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