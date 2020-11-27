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
                $badge = get_field('compte_verifie');
                $twitter = get_field('twitter');
                $facebook = get_field('facebook');
                $instagram = get_field('instagram');
                $youtube = get_field('youtube');
            ?>
            <div class="artist-presentation">
                <div class="artist-presentation__picture">
                    <?php the_post_thumbnail('thumbnail'); ?>
                </div>
                <div class="artist-presentation__info">
                    <div class="artist-presentation__info-name">
                        <?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>
                        <?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
                    </div>
                    <div class="artist-presentation__info-reseaux">
                        <ul>
                            <?= ($twitter) ? '<li><a href="'.$twitter.'" target="_blank"><i class="fab fa-twitter"></i></a></li>' : ''; ?>
                            <?= ($instagram) ? '<li><a href="'.$instagram.'" target="_blank"><i class="fab fa-instagram"></i></a></li>' : ''; ?>
                            <?= ($facebook) ? '<li><a href="'.$facebook.'" target="_blank"><i class="fab fa-facebook-f"></i></a></li>' : ''; ?>
                            <?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><i class="fab fa-youtube"></i></a></li>' : ''; ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="artist-bio">
                <?php
                    the_content( sprintf(
                        /* translators: %s: Name of current post. */
                        wp_kses( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'pepseeactus' ), array( 'span' => array( 'class' => array() ) ) ),
                        the_title( '<span class="screen-reader-text">"', '"</span>', false )
                    ) );
        
                    wp_link_pages( array(
                        'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'pepseeactus' ),
                        'after'  => '</div>',
                    ) );
                ?>
            </div>
            <div class="artist-music">
                <?php $posts = get_field('musique_associees');
                if ($posts): ?>
                    <h2>Singles</h2>
                    <div class="artist-music__container">
                        <?php foreach ($posts as $post) {
                            $artistes = get_field('artistes');
                            $titre = get_field('titre');
                            $download = get_field('download');
                            $soundcloud = get_field('soundcloud');
                            $youtube = get_field('youtube');
                            $spotify = get_field('spotify');
                            $deezer = get_field('deezer');
                            $google = get_field('google_play_music');
                            $tidal = get_field('tidal');
                            $apple = get_field('apple_music'); ?>

                            <div class="artist-music__container-box col-12 col-md-6">
                                <div class="music-image rotate">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="music-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="music-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <ul>
                                        <?= ($download) ? '<li><a href="'.$download.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-download.png" alt="download"></a></li>' : ''; ?>
                                        <?= ($soundcloud) ? '<li><a href="'.$soundcloud.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-soundcloud.png" alt="soundcloud"></a></li>' : ''; ?>
                                        <?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-youtube.png" alt="youtube music"></a></li>' : ''; ?>
                                        <?= ($spotify) ? '<li><a href="'.$spotify.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-spotify.png" alt="spotify"></a></li>' : ''; ?>
                                        <?= ($deezer) ? '<li><a href="'.$deezer.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-deezer.png" alt="deezer"></a></li>' : ''; ?>
                                        <?= ($google) ? '<li><a href="'.$google.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-google.png" alt="google play music"></a></li>' : ''; ?>
                                        <?= ($tidal) ? '<li><a href="'.$tidal.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-tidal.png" alt="tidal"></a></li>' : ''; ?>
                                        <?= ($apple) ? '<li><a href="'.$apple.'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-apple.png" alt="apple music"></a></li>' : ''; ?>
                                    </ul>
                                </div>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </div>
            <div class="artist-album">
                <?php $posts = get_field('albums_associes');
                if ($posts): ?>
                    <h2>Discographie</h2>
                    <div class="artist-album__container">
                        <?php foreach ($posts as $post) {
                            $artistes = get_field('artistes');
                            $titre = get_field('titre');
                            $download = get_field('download');
                            $backlink = get_field('backlink');
                            $soundcloud = get_field('soundcloud');
                            $youtube = get_field('youtube');
                            $spotify = get_field('spotify');
                            $deezer = get_field('deezer');
                            $apple = get_field('apple_music'); ?>

                            <div class="artist-album__container-box col-12 col-md-6">
                                <div class="album-image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="album-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="album-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <ul>
                                        <?= ($download) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><i class="fa fa-cloud-download"></i> Download</a></li>' : ''; ?>
                                        <?= ($backlink) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><i class="fas fa-shopping-cart"></i> Streamer</a></li>' : ''; ?>
                                        <?= ($soundcloud) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-soundcloud.png" alt="soundcloud"></a></li>' : ''; ?>
                                        <?= ($youtube) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-youtube.png" alt="youtube music"></a></li>' : ''; ?>
                                        <?= ($spotify) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-spotify.png" alt="spotify"></a></li>' : ''; ?>
                                        <?= ($deezer) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-deezer.png" alt="deezer"></a></li>' : ''; ?>
                                        <?= ($google) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-google.png" alt="google play music"></a></li>' : ''; ?>
                                        <?= ($tidal) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-tidal.png" alt="tidal"></a></li>' : ''; ?>
                                        <?= ($apple) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-apple.png" alt="apple music"></a></li>' : ''; ?>
                                    </ul>
                                </div>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </div>
            <div class="artist-clip">
                <?php $posts = get_field('clips_associes');
                if ($posts):?>
                    <h2>Videos</h2>
                    <div class="artist-clip__container">
                        <?php foreach ($posts as $post) { ?>
                            <div class="artist-clip__container-box col-12 col-md-6">
                                <div>
                                    <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
                                    <a href="<?php the_permalink(); ?>"><svg height="100%" version="1.1" viewBox="0 0 68 48" width="100%"><path class="ytp-large-play-button-bg" d="M66.52,7.74c-0.78-2.93-2.49-5.41-5.42-6.19C55.79,.13,34,0,34,0S12.21,.13,6.9,1.55 C3.97,2.33,2.27,4.81,1.48,7.74C0.06,13.05,0,24,0,24s0.06,10.95,1.48,16.26c0.78,2.93,2.49,5.41,5.42,6.19 C12.21,47.87,34,48,34,48s21.79-0.13,27.1-1.55c2.93-0.78,4.64-3.26,5.42-6.19C67.94,34.95,68,24,68,24S67.94,13.05,66.52,7.74z" fill="#212121" fill-opacity="0.8"></path><path d="M 45,24 27,14 27,34" fill="#fff"></path></svg></a>
                                </div>
                                <p><?php the_title(); ?></p>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
        <?php get_sidebar(); ?>
    </div>
<?php endwhile; ?>
<?php get_footer();