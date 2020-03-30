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
            <div class="artist-album">
                <?php $posts = get_field('albums_associes');
                if ($posts): ?>
                    <h2>discographie</h2>
                    <div class="artist-album__container">
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
                                        <?= ($download) ? '<li><a href="'.get_the_permalink($post).'" target="_blank"><img src="'.get_stylesheet_directory_uri().'/assets/img/logo-download.png" alt="download"></a></li>' : ''; ?>
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
            <div class="artist-music">
                <?php $posts = get_field('musique_associees');
                if ($posts): ?>
                    <h2>brand new</h2>
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
                                <div class="music-image">
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
                    <a class="more" href="<?= get_post_type_archive_link('music'); ?>">Plus de sons de ici</a>
                <?php endif; ?>
            </div>
            <div class="artist-clip">
                <?php $posts = get_field('clips_associes');
                if ($posts):?>
                    <h2>videos</h2>
                    <div class="artist-clip__container">
                        <?php foreach ($posts as $post) { ?>
                            <div class="artist-clip__container-box col-12 col-md-6">
                                <div>
                                    <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
                                    <i class="far fa-play-circle"></i>
                                </div>
                                <p><?php the_title(); ?></p>
                            </div>
                        <?php } ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                    <a class="more" href="<?= site_url('/category/clips/'); ?>">Plus de clips ici</a>
                <?php endif; ?>
            </div>
        </div>
        <?php get_sidebar(); ?>
    </div>
<?php endwhile; ?>
<?php get_footer();