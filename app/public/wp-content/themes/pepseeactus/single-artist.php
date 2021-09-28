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
            <?php $badge = get_field('compte_verifie'); ?>
            <div class="artist-presentation">
                <div class="artist-presentation__picture">
                    <?php the_post_thumbnail('thumbnail'); ?>
                </div>
                <div class="artist-presentation__info">
                    <div class="artist-presentation__info-name">
                        <?php the_title( '<h1 class="entry-title title-angle">', '</h1>' ); ?>
                        <?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
                    </div>
                    <div class="artist-presentation__info-reseaux">
                        <?php get_template_part( 'parts/reseaux-template' ); ?>
                    </div>
                </div>
            </div>
            <div class="artist-bio readmore">
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
                <p class="readmore-link"><a href="#">Voir plus</a></p>
            </div>

            <div class="artist-music">
                <?php 
                $posts = get_field('musique_associees');

                if (!empty($posts)) :
                // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts): setup_postdata($post); ?>
                    <h2>Singles</h2>
                    <div class="artist-music__container">
                        <?php foreach ($posts as $post) : setup_postdata($post);
                            $artistes = get_field('artistes');
                            $titre = get_field('titre'); ?>
                            <div class="artist-music__container-box col-12 col-md-6">
                                <div class="music-image rotate">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="music-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= wp_trim_words( $artistes, 8, '...' ); ?></a>
                                    <a class="music-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) != current_time( 'Y' ) ) {
                                            the_date('Y');
                                        } else {
                                            the_date('F Y');
                                        } ?>
                                    </span>
                                    <?php get_template_part( 'parts/link-template' ); ?>
                                </div>
                            </div>
                        <?php endforeach;
                        wp_reset_postdata(); ?>
                    </div>
                <?php endif; ?>
            </div>

            <div class="artist-album">
                <?php 
                $posts = get_field('albums_associes');

                if (!empty($posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts): ?>
                    <h2>Discographie</h2>
                    <div class="artist-album__container">
                        <?php foreach ($posts as $post) : setup_postdata($post);
                            $artistes = get_field('artistes');
                            $titre = get_field('titre'); ?>
                            <div class="artist-album__container-box col-12 col-md-6">
                                <div class="album-image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="album-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="album-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) != current_time( 'Y' ) ) {
                                            the_date('Y');
                                        } else {
                                            the_date('F Y');
                                        } ?>
                                    </span>
                                    <?php get_template_part( 'parts/link-template' ); ?>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php wp_reset_postdata();
                endif; ?>
            </div>

            <div class="artist-album album-invite">
                <?php 
                $posts = get_field('albums_invites');

                if (!empty($posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts): ?>
                    <h2>Apparaît sur ce<?= (count($posts) <= 1 ? 't' : 's'); ?> album<?= (count($posts) <= 1 ? '' : 's'); ?></h2>
                    <div class="artist-album__container">
                        <?php foreach ($posts as $post) : setup_postdata($post);
                            $artistes = get_field('artistes');
                            $titre = get_field('titre'); ?>
                            <div class="artist-album__container-box col-12 col-md-6">
                                <div class="album-image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="album-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="album-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) != current_time( 'Y' ) ) {
                                            the_date('Y');
                                        } else {
                                            the_date('F Y');
                                        } ?>
                                    </span>
                                    <?php get_template_part( 'parts/link-template' ); ?>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php wp_reset_postdata();
                endif; ?>
            </div>

            <div class="artist-album artist-riddim">
                <?php $posts = get_field('riddims_associes');

                if (!empty($posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts): ?>
                    <h2>Apparaît sur ce<?= (count($posts) <= 1 ? '' : 's'); ?> riddim<?= (count($posts) <= 1 ? '' : 's'); ?></h2>
                    <div class="artist-album__container">
                        <?php foreach ($posts as $post) : setup_postdata($post);
                            $artistes = get_field('artistes');
                            $titre = get_field('titre'); ?>
                            <div class="artist-album__container-box col-12 col-md-6">
                                <div class="album-image">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="album-info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="album-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( is_year() ) {
                                            the_date('Y');
                                        } else {
                                            the_date('F Y');
                                        } ?>
                                    </span>
                                    <?php get_template_part( 'parts/link-template' ); ?>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php wp_reset_postdata();
                endif; ?>
            </div>

            <div class="actus">
                <?php 
                $posts = get_field('actus_associes');

                if (!empty($posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts):
                ?>
                    <h2>L'actus de <?php the_title(); ?></h2>
                    <div class="swiper-container swiper-actus">
                        <div class="swiper-button-prev">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 386.242 386.242" xml:space="preserve">
                            <path id="Arrow_Back" d="M374.212,182.3H39.432l100.152-99.767c4.704-4.704,4.704-12.319,0-17.011
                                c-4.704-4.704-12.319-4.704-17.011,0L3.474,184.61c-4.632,4.632-4.632,12.379,0,17.011l119.1,119.1
                                c4.704,4.704,12.319,4.704,17.011,0c4.704-4.704,4.704-12.319,0-17.011L39.432,206.36h334.779c6.641,0,12.03-5.39,12.03-12.03
                                S380.852,182.3,374.212,182.3z"/>
                        </svg>
                        </div>
                        <div class="swiper-button-next">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 384.97 384.97" style="enable-background:new 0 0 384.97 384.97;" xml:space="preserve">
                            <path id="Arrow_Forward" d="M384.97,192.487c0-3.212-1.323-6.28-3.525-8.59L262.357,63.606c-4.704-4.752-12.319-4.74-17.011,0
                                c-4.704,4.74-4.704,12.439,0,17.179l98.564,99.551H12.03C5.39,180.337,0,185.774,0,192.487c0,6.713,5.39,12.151,12.03,12.151
                                h331.868l-98.552,99.551c-4.704,4.74-4.692,12.439,0,17.179c4.704,4.74,12.319,4.74,17.011,0l119.088-120.291
                                C383.694,198.803,384.934,195.675,384.97,192.487z"/>
                        </svg>
                        </div>
                        <!-- Additional required wrapper -->
                        <div class="swiper-wrapper">
                            <?php foreach ($posts as $post) : setup_postdata($post) ?>
                                <!-- Slides -->
                                <article id="post-<?php the_ID(); ?>" <?php post_class("swiper-slide"); ?>>
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <div class="thumbnail-wrapper">
                                            <img src="<?= get_the_post_thumbnail_url($post); ?>" alt="<?= get_the_title($post); ?>">
                                        </div>
                                    </a>
                                    <div class="actus-single">
                                        <div class="entry-title">
                                            <a href="<?= get_the_permalink($post); ?>"><?= wp_trim_words( get_the_title($post), 10, '...' ); ?></a>
                                        </div>
                                    </div>
                                </article>
                            <?php endforeach;
                            wp_reset_postdata(); ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>

        </div>
        <?php get_sidebar(); ?>
    </div>
<?php endwhile; ?>
<?php get_footer();