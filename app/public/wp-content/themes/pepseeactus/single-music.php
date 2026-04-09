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
        $credits = get_field('credits');
        $artistes = get_field('artistes');
        $artistes_display = '';
        if ( is_array( $artistes ) ) {
            $names = array();
            foreach ( $artistes as $artiste ) {
                $name = get_the_title( $artiste );
                if ( $name ) {
                    $names[] = $name;
                }
            }
            $artistes_display = implode( '/ ', $names );
        } elseif ( is_string( $artistes ) ) {
            $artistes_display = trim( $artistes );
        }
        $titre = get_field('titre');
        $riddim = get_field('riddim');
        $cover_id = get_post_thumbnail_id();
        $cover_url = $cover_id ? wp_get_attachment_image_url( $cover_id, 'thumbnail' ) : '';
        $cover_host = $cover_url ? wp_parse_url( $cover_url, PHP_URL_HOST ) : '';
        $site_host  = wp_parse_url( home_url(), PHP_URL_HOST );

        $cover_attributes = array(
            'id'    => 'pa-cover',
            'class' => 'attachment-thumbnail size-thumbnail wp-post-image',
        );

        if ( $cover_host && $site_host && $cover_host !== $site_host ) {
            $cover_attributes['crossorigin'] = 'anonymous';
        }
    ?>

    <div>
        <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
            <div class="single-music">
                <div class="music-presentation">
                    <div class="music-presentation__picture rotate">
                        <?php echo wp_get_attachment_image( $cover_id, array( 250, 250 ), false, $cover_attributes ); ?>
                    </div>
                    <div class="music-presentation__info">
                        <div class="music-presentation__info-name">
                            <span class="entry-title name"><?= wp_trim_words( $artistes_display, 10, '...' ); ?></span><br>
                            <span class="entry-title"><?= $titre ?></span>
                        </div>
                        <div class="media-links">
                            <?php get_template_part( 'parts/stream-link-template' ); ?>
                        </div>
                    </div>
                </div>
                <div class="music-content">
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
                                        <div class="associated-artist__info">
                                            <a class="associated-artist__name" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                            <?php if ($badge) echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>'; ?>
                                        </div>
                                <?php } ?>
                                <?php wp_reset_postdata(); ?>
                            </div>
                        <?php endif; ?>
                    </section>
                    <div class="social-sharing">
                        <?php get_template_part( 'parts/sharing-buttons' ); ?>
                    </div>
                    <div>
                        <h2>Crédits</h2>
                        <?php $beatmakers = get_field('beatmaker'); ?>
                        <?php $genres = get_field('genres'); ?>
                        <?php $mixs = get_field('mix'); ?>
                        <?php $masterings = get_field('mastering'); ?>
                        <?php $credits_more = get_field('more'); ?>
                        <?php $label = get_field('label'); ?>
                        <?php $posts = get_field('albums_associes'); ?>
                        <ul>
                            <li>Titre : <?= $titre ?></li>
                            <li><?= ($riddim) ? 'Riddim : '.$riddim.' Riddim' : ''; ?></li>
                            <li>
                                <?php if ( ! empty( $artistes ) ): ?>
                                    Artistes :
                                        <?php if ( is_array( $artistes ) ) { ?>
                                            <?php foreach ( $artistes as $artiste ) { ?>
                                                <a href="<?= esc_url( get_permalink( $artiste ) ); ?>"><b><?= esc_html( get_the_title( $artiste ) ); ?></b></a>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <?= esc_html( $artistes_display ); ?>
                                        <?php } ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ($beatmakers): ?>
                                    Beatmaker :
                                        <?php
                                            $beatmaker_links = array();
                                            foreach ($beatmakers as $beatmaker) {
                                                $beatmaker_links[] = sprintf(
                                                    '<a href="%s"><b>%s</b></a>',
                                                    esc_url( get_the_permalink( $beatmaker ) ),
                                                    esc_html( get_the_title( $beatmaker ) )
                                                );
                                            }
                                            echo implode( ' / ', $beatmaker_links );
                                        ?>
                                    <?php wp_reset_postdata(); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ($genres): ?>
                                    Genre musical :
                                        <?php
                                            $genre_links = array();
                                            foreach ( $genres as $genre ) {
                                                $genre_links[] = sprintf(
                                                    '<a href="%s">%s</a>',
                                                    esc_url( get_term_link( $genre ) ),
                                                    esc_html( $genre->name )
                                                );
                                            }
                                            echo implode( ' / ', $genre_links );
                                        ?>
                                    <?php wp_reset_postdata(); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ($mixs): ?>
                                    Mix :
                                        <?php
                                            $mix_links = array();
                                            foreach ($mixs as $mix) {
                                                $mix_links[] = sprintf(
                                                    '<a href="%s"><b>%s</b></a>',
                                                    esc_url(get_the_permalink($mix)),
                                                    esc_html(get_the_title($mix))
                                                );
                                            }
                                            echo implode(' / ', $mix_links);
                                        ?>
                                    <?php wp_reset_postdata(); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ($masterings): ?>
                                    Mastering :
                                        <?php
                                            $mastering_links = array();
                                            foreach ($masterings as $mastering) {
                                                $mastering_links[] = sprintf(
                                                    '<a href="%s"><b>%s</b></a>',
                                                    esc_url(get_the_permalink($mastering)),
                                                    esc_html(get_the_title($mastering))
                                                );
                                            }
                                            echo implode(' / ', $mastering_links);
                                        ?>
                                    <?php wp_reset_postdata(); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ( $label ) : ?>
                                    Label : <?php echo wp_kses_post( $label ); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php
                                    $credits_more = is_string($credits_more) ? trim($credits_more) : '';
                                ?>
                                <?php if ( $credits_more !== '' ) : ?>
                                    <?php echo wp_kses_post( $credits_more ); ?>
                                <?php endif; ?>
                            </li>
                            <li>
                                <?php if ($posts): ?>
                                    <?php foreach ($posts as $post) { ?>
                                        Extrait de l'album : <a href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
                                    <?php } ?>
                                    <?php wp_reset_postdata(); ?>
                                <?php endif; ?>
                            </li>
                            <li>Date de sortie : <?php echo get_the_date('d F Y'); ?></li>
                        </ul>
                    </div>
                    <?php the_content(); ?>
                </div>
            </div>
        </div>
    </div>
<?php endwhile; ?>

<?php
get_footer();
