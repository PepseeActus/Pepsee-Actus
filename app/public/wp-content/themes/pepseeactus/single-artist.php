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
            <div id="accordion">
                <div class="card artist-music">
                    <?php $posts = get_field('musique_associees');
                    if ($posts): ?>
                        <div id="headingOne">
                            <h2>
                                <div class="panel-title" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Singles
                                </div>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <div class="artist-music__container">
                                    <?php foreach ($posts as $post) {
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
                                                <?php get_template_part( 'parts/link-template' ); ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php wp_reset_postdata(); ?>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="card artist-album">
                    <?php $posts = get_field('albums_associes');
                    if ($posts): ?>
                        <div id="headingTwo">
                            <h2>
                                <div class="panel-title" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Discographie
                                </div>
                            </h2>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <?php foreach ($posts as $post) {
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
                                            <?php get_template_part( 'parts/link-template' ); ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <?php wp_reset_postdata(); ?>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <?php get_sidebar(); ?>
    </div>
<?php endwhile; ?>
<?php get_footer();