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
                <div class="media-links">
                    <?php get_template_part( 'parts/stream-link-template' ); ?>
                </div>
            </div>
        </div>
        <div class="music-content">
            <section class="artist-album">
                <?php
                $artistes_principal = get_field('artistes_principal');
                $posts = get_field('artistes_associes');
                if ($artistes_principal || $posts): ?>
                    <div class="artist-image__container">
                        <?php if ($artistes_principal): ?>
                            <?php foreach ($artistes_principal as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="artist-image">
                                        <a href="<?= get_the_permalink($post); ?>">
                                            <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                        </a>
                                    </div>
                            <?php } ?>
                        <?php endif; ?>
                        <?php if ($posts): ?>
                            <?php foreach ($posts as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="artist-image">
                                        <a href="<?= get_the_permalink($post); ?>">
                                            <img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
                                        </a>
                                    </div>
                            <?php } ?>
                        <?php endif; ?>
                        <?php wp_reset_postdata(); ?>
                    </div>
                <?php endif;
                if ($artistes_principal || $posts): ?>
                    <div class="artist-info__container">
                        <?php if ($artistes_principal): ?>
                            <?php foreach ($artistes_principal as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="associated-artist__info">
                                        <a class="associated-artist__name" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                        <?php if ($badge) echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>'; ?>
                                    </div>
                            <?php } ?>
                        <?php endif; ?>
                        <?php if ($posts): ?>
                            <?php foreach ($posts as $post) {
                                $badge = get_field('compte_verifie'); ?>
                                    <div class="associated-artist__info">
                                        <a class="associated-artist__name" href="<?= get_the_permalink($post); ?>"><?= get_the_title(); ?></a>
                                        <?php if ($badge) echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>'; ?>
                                    </div>
                            <?php } ?>
                        <?php endif; ?>
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
	                <?php
	                    $genres = get_field('genres');
	                    if (empty($genres)) {
	                        $genres = get_the_terms(get_the_ID(), 'genre');
	                    }
	                ?>
                <?php $mixs = get_field('mix'); ?>
                <?php $masterings = get_field('mastering'); ?>
                <?php $credits_more = get_field('more'); ?>
                <?php $label = get_field('label'); ?>
                <ul>
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
                        <?php $compositeur = get_field('compositeur');
                        if ($compositeur): ?>
                            Compositeur : <b><?= $compositeur ?></b>
                        <?php endif; ?>
                    </li>
                    <li>
                        <?php if ($genres): ?>
                            Genre musical :
                                <?php
                                    $genre_links = array();
                                    foreach ( $genres as $genre ) {
                                        if ( $genre instanceof WP_Term ) {
                                            $genre_links[] = sprintf(
                                                '<a href="%s">%s</a>',
                                                esc_url( get_term_link( $genre ) ),
                                                esc_html( $genre->name )
                                            );
                                        } elseif ( is_numeric( $genre ) ) {
                                            $term = get_term( (int) $genre );
                                            if ( $term && ! is_wp_error( $term ) ) {
                                                $genre_links[] = sprintf(
                                                    '<a href="%s">%s</a>',
                                                    esc_url( get_term_link( $term ) ),
                                                    esc_html( $term->name )
                                                );
                                            }
                                        } elseif ( is_string( $genre ) && $genre !== '' ) {
                                            $genre_links[] = esc_html( $genre );
                                        }
                                    }
                                    echo implode( ' / ', $genre_links );
                                ?>
                            <?php wp_reset_postdata(); ?>
                        <?php endif; ?>
                    </li>
                    <li>
                        <?php if ($mixs): ?>
                            Mix :
                                <?php foreach ($mixs as $mix) { ?>
                                    <a href="<?= get_the_permalink($mix); ?>"><b><?= get_the_title($mix); ?></b></a>
                                <?php } ?>
                            <?php wp_reset_postdata(); ?>
                        <?php endif; ?>
                    </li>
                    <li>
                        <?php if ($masterings): ?>
                            Mastering :
                                <?php foreach ($masterings as $mastering) { ?>
                                    <a href="<?= get_the_permalink($mastering); ?>"><b><?= get_the_title($mastering); ?></b></a>
                                <?php } ?>
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
                    <li>Date de sortie : <?php echo get_the_date('d F Y'); ?></li>
                </ul>
            </div>
            <?php the_content(); ?>
        </div>
    </div>
</div>
<?php endwhile; ?>

<?php
get_footer();
