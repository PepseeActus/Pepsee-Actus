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
	<div>
		<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
			<div class="post-thumbnail">
				<?php the_post_thumbnail('large'); ?>
				<?php the_title( '<h3 class="single-title"><span>', '</span></h3>' ); ?>
			</div>


			<div class="single-content">
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


				<?php $songs = get_field('musique_associees');
				if ($songs) : ?>
					<div class="music-related">
						<?php foreach ($songs as $song) { ?>
							<div class="music-box">
								<a class="music-cover rotate" href="<?php get_the_permalink($song); ?>">
									<img src="<?= get_the_post_thumbnail_url($song, 'thumbnail'); ?>" alt="<?= get_the_title($song); ?>">
								</a>
								<div class="media-card-row__info media-listing__info">
									<a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($song); ?>"><?= get_the_title($song); ?></a>
								</div>
							</div>
						<?php } ?>
						<?php wp_reset_postdata(); ?>
					</div>
				<?php endif; ?>


				<div class="post-meta">
					<?php the_author(); ?>, le <?php the_date(); ?>
					<div><i class="fa fa-eye"></i><?= do_shortcode( '[jp_post_view]' ); ?></div>
				</div>
			</div>

			<?php $posts = get_field('artistes_associes');
			if ($posts): ?>
				<div class="artist desktop-visually-hidden">
					<h3 class="widget-title">Artiste<?= (count($posts) > 1) ? 's' : ''; ?></h3>
					<div class="artist__container">
						<?php foreach ($posts as $post) {
							$badge = get_field('compte_verifie');?>
							
							<div class="artist__container-box">
								<div class="artist-image">
									<a href="<?= get_the_permalink($post); ?>">
										<img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
									</a>
								</div>
								<div class="associated-artist__info">
									<a class="associated-artist__name" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
									<?php if ($badge) echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>'; ?>
									<?php get_template_part( 'parts/reseaux-template' ); ?>
								</div>
							</div>
						<?php } ?>
						<?php wp_reset_postdata(); ?>
					</div>
				</div>
			<?php endif; ?>
		</article>
	</div>
<?php endwhile; ?>

<?php
get_footer();
