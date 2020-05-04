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
        <div id="post-<?php the_ID(); ?>" <?php post_class('background-white col-12 col-md-9'); ?>>
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
                        <ul>
                            <?= ($download) ? '<li><a href="'.$download.'" target="_blank"><i class="fa fa-cloud-download"></i> Download</li>' : ''; ?>
                            <?= ($backlink) ? '<li><a href="'.$backlink.'" target="_blank"><i class="fas fa-shopping-cart"></i> Acheter</li>' : ''; ?>
                            <?= ($soundcloud) ? '<li><a href="'.$soundcloud.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-soundcloud.png" alt="soundcloud"></a></li>' : ''; ?>
                            <?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-youtube.png" alt="youtube music"></a></li>' : ''; ?>
                            <?= ($spotify) ? '<li><a href="'.$spotify.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-spotify.png" alt="spotify"></a></li>' : ''; ?>
                            <?= ($deezer) ? '<li><a href="'.$deezer.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-deezer.png" alt="deezer"></a></li>' : ''; ?>
                            <?= ($apple) ? '<li><a href="'.$apple.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-apple.png" alt="apple music"></a></li>' : ''; ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="music-content">
                <?php the_content(); ?>
            </div>
        </div>
        <aside class="col-12 col-md-3">
            <div class="artist-album">
                <?php $posts = get_field('artistes_associes');
                if ($posts): ?>
                    <h2>Artiste<?= (count($posts) > 1) ? 's' : ''; ?></h2>
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
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
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
            </div>
            <div class="instagram-feed mobile-visually-hidden">
                <?= do_shortcode("[instagram-feed]"); ?>
            </div>
        </aside>
    </div>
<?php endwhile; ?>

<?php
get_footer();