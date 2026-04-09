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
    <div>
        <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
            <?php $badge = get_field('compte_verifie'); ?>
            <?php $status = get_field('status'); ?>
            <div class="artist-presentation">
                <div class="artist-presentation__picture">
                    <?php the_post_thumbnail('thumbnail'); ?>
                </div>
                <div class="artist-presentation__info">
                    <div class="artist-presentation__info-name">
                        <?php the_title( '<h1 class="entry-title title-angle">', '</h1>' ); ?>
                        <?php if ($badge) echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>'; ?>
                    </div>
                    <div class="artist-presentation__info-reseaux">
                        <?php get_template_part( 'parts/reseaux-template' ); ?>
                    </div>
                    <div class="artist-presentation__status">
                        <?php if ($status) echo $status; ?>
                    </div>
                </div>
            </div>
            <?php 
            $perso = get_field('info_perso'); 

            if ($perso) {
                $nom      = get_field('nom');
                $origine  = get_field('origine');
                $genres   = get_field('genres') ?: [];
                $internet = get_field('internet');
                $parents  = get_field('parents');
                $enfants  = get_field('enfants');
                $siblings = get_field('siblings');
                $cousins  = get_field('cousins');
                ?>
                
                <div class="artist-perso">
                    <h2>Biographie</h2>
                    <ul>
                        <?php if ($nom): ?>
                            <li><b>Nom de naissance</b> : <?php echo $nom; ?></li>
                        <?php endif; ?>
                        <?php 
                        $naissance = get_field('naissance', false, false);
                        $deces = get_field('deces', false, false);

                        if ($naissance):
                            $date_naissance = new DateTime($naissance);
                            $age = null;

                            if ($deces) {
                                $date_deces = new DateTime($deces);
                                $age = $date_deces->diff($date_naissance)->y;
                                $info_age = '(mort à ' . $age . ' ans)';
                                $date_affichee = date_i18n('j F Y', strtotime($naissance)) . ' – ' . date_i18n('j F Y', strtotime($deces));
                            } else {
                                $today = new DateTime();
                                $age = $today->diff($date_naissance)->y;
                                $info_age = '(' . $age . ' ans)';
                                $date_affichee = date_i18n('j F Y', strtotime($naissance));
                            }
                            ?>
                            <li><b>Date de naissance</b> : <?php echo $date_affichee . ' ' . $info_age; ?></li>
                        <?php endif; ?>
                        <?php if ($origine && is_array($origine)): ?>
                            <li><b>Origine</b> : <?php echo implode(' / ', $origine); ?></li>
                        <?php endif; ?>
                        <?php if (!empty($genres) && is_array($genres)): ?>
                            <li>
                                <b>Genres musicaux</b> :
                                <?php
                                    $links = [];
                                    foreach ($genres as $genre) {
                                        if ($genre instanceof WP_Term) {
                                            $links[] = '<a href="' . esc_url(get_term_link($genre)) . '"><u>' . esc_html($genre->name) . '</u></a>';
                                        }
                                    }
                                    echo implode(' / ', $links);
                                ?>
                            </li>
                        <?php endif; ?>
                        <?php if ( $parents ): ?>
                            <li><b><?= count($parents) > 1 ? 'Parents' : 'Parent' ?></b> :
                                <?php foreach ( $parents as $p ) :
                                    setup_postdata( $p );
                                    $allParents[] = '<a href="' . get_the_permalink($p) . '"><u>' . get_the_title($p) . '</u></a>';
                                endforeach;
                                echo implode(' / ', $allParents);
                                wp_reset_postdata(); ?>
                            </li>
                        <?php endif; ?>
                        <?php if ( $enfants ): ?>
                            <li><b><?= count($enfants) > 1 ? 'Enfants' : 'Enfant' ?></b> :
                                <?php foreach ( $enfants as $p ) :
                                    setup_postdata( $p );
                                    $allEnfants[] = '<a href="' . get_the_permalink($p) . '"><u>' . get_the_title($p) . '</u></a>';
                                endforeach;
                                echo implode(' / ', $allEnfants);
                                wp_reset_postdata(); ?>
                            </li>
                        <?php endif; ?>
                        <?php if ( $siblings ): ?>
                            <li><b><?= count($siblings) > 1 ? 'Frères et sœurs' : 'Frère ou sœur' ?></b> :
                                <?php foreach ( $siblings as $p ) :
                                    setup_postdata( $p );
                                    $allSiblings[] = '<a href="' . get_the_permalink($p) . '"><u>' . get_the_title($p) . '</u></a>';
                                endforeach;
                                echo implode(' / ', $allSiblings);
                                wp_reset_postdata(); ?>
                            </li>
                        <?php endif; ?>
                        <?php if ( $cousins ): ?>
                            <li><b><?= count($cousins) > 1 ? 'Cousins' : 'Cousin' ?></b> :
                                <?php foreach ( $cousins as $p ) :
                                    setup_postdata( $p );
                                    $allCousins[] = '<a href="' . get_the_permalink($p) . '"><u>' . get_the_title($p) . '</u></a>';
                                endforeach;
                                echo implode(' / ', $allCousins);
                                wp_reset_postdata(); ?>
                            </li>
                        <?php endif; ?>
                        <?php if ($internet): ?>
                            <li><b>Site Web</b> : <?php echo '<a href="'.$internet.'" target="_blank">'.$internet.'</a>'?></li>
                        <?php endif; ?>
                    </ul>
                </div>

            <?php 
            } 
            ?>
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
                $music_posts = get_field('musique_associees');
                if (!empty($music_posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($music_posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ( $music_posts ) { ?>
                    <h2>Singles</h2>
                    <div class="artist-music__container">
                        <?php $i = 0;
                        foreach ( $music_posts as $post ) :
                            setup_postdata( $post );
                            $artistes = get_field('artistes');
                            $titre = get_field('titre');
                            if ( $i < 8 ) { ?>
                                <div class="artist-music__container-box media-card-row col-12 col-md-6">
                                    <div class="music-image media-card-row__thumb rotate">
                                        <a href="<?= get_the_permalink($post); ?>">
                                            <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                        </a>
                                    </div>
                                    <div class="media-card-row__info media-listing__info">
                                        <a href="<?= get_the_permalink($post); ?>"><?= wp_trim_words( $artistes, 8, '...' ); ?></a>
                                        <a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($post); ?>"><?= wp_trim_words( $titre, 5, '...' ); ?></a>
                                        <span>
                                            <?php echo get_the_date('F Y'); ?>
                                        </span>
                                        <?php get_template_part( 'parts/link-template' ); ?>
                                    </div>
                                </div>
                                <?php $i++;
                            } else {
                                break;
                            }
                        endforeach;
                        wp_reset_postdata(); ?>
                    </div>
                    <?php if ( count($music_posts) > 8 ) {
                        echo '<button id="see-more">Voir plus</button>';
                    }
                } ?>

                <script>
                    jQuery(function($){
                        var allMusicIDs = <?php echo json_encode( wp_list_pluck( $music_posts, 'ID' ) ); ?>;
                        var post_per_page = 8;
                        var page = 1;
                        var max_pages = Math.ceil(allMusicIDs.length / post_per_page);

                        $('#see-more').click(function(){
                            page++;
                            var offset = (page - 1) * post_per_page;
                            var music_ids = allMusicIDs.slice(offset, offset + post_per_page);

                            $.ajax({
                                url: pepsee_loadmore_params.ajaxurl,
                                type: 'POST',
                                data: {
                                    action: 'load_music',
                                    music_ids: music_ids
                                },
                                beforeSend: function(){
                                    $('#see-more').text('Chargement en cours...');
                                },
                                success: function(response){
                                    $('.artist-music__container').append(response);
                                    if ( page >= max_pages ) {
                                        $('#see-more').hide();
                                    } else {
                                        $('#see-more').text('Voir plus');
                                    }
                                }
                            });
                        });
                    });
                </script>
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
                            <div class="artist-album__container-box media-card-row col-12 col-md-6">
                                <div class="album-image media-card-row__thumb">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="media-card-row__info media-listing__info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
                                            echo get_the_date('Y');
                                        } else {
                                            echo get_the_date('F Y');
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
                            <div class="artist-album__container-box media-card-row col-12 col-md-6">
                                <div class="album-image media-card-row__thumb">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="media-card-row__info media-listing__info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
                                            echo get_the_date('Y');
                                        } else {
                                            echo get_the_date('F Y');
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
                            <div class="artist-album__container-box media-card-row col-12 col-md-6">
                                <div class="album-image media-card-row__thumb">
                                    <a href="<?= get_the_permalink($post); ?>">
                                        <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                    </a>
                                </div>
                                <div class="media-card-row__info media-listing__info">
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
                                            echo get_the_date('Y');
                                        } else {
                                            echo get_the_date('F Y');
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
                                        <div class="thumbnail-wrapper" style="background-image: url('<?= get_the_post_thumbnail_url(); ?>')"></div>
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
    </div>
<?php endwhile; ?>

<?php get_footer();
