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
                <?php $posts = get_field('musique_associees');
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
                                    <a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
                                    <a class="music-title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
                                    <span>
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
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
                <?php $posts = get_field('albums_associes');

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
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
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
                <?php $posts = get_field('albums_invites');

                if (!empty($posts)) :
                    // sort the posts by post date, but you can also sort on ID or whatever
                    usort($posts, function($a, $b) {
                        return strcmp($b->post_date,$a->post_date);
                    });
                endif;

                if ($posts): ?>
                    <h2><?php the_title(); ?> a composé sur ce<?= (count($posts) <= 1 ? 't' : 's'); ?> album<?= (count($posts) <= 1 ? '' : 's'); ?></h2>
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
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
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
                    <h2><?php the_title(); ?> a composé ce<?= (count($posts) <= 1 ? '' : 's'); ?> riddim<?= (count($posts) <= 1 ? '' : 's'); ?></h2>
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
                                        <?php if ( get_the_time( 'Y' ) < '2015' ) {
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

        </div>
        <?php get_sidebar(); ?>
    </div>
<?php endwhile; ?>
<?php get_footer();