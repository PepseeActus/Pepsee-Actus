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
	<div class="row">
		<article id="post-<?php the_ID(); ?>" <?php post_class('col-12 col-lg-9'); ?>>
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
								<div class="music-info">
									<a href="<?= get_the_permalink($song); ?>"><?= get_the_title($song); ?></a>
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


			<div id="graphcomment"></div>
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
								<div class="artist-info">
									<a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
									<?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
									<?php get_template_part( 'parts/reseaux-template' ); ?>
								</div>
							</div>
						<?php } ?>
						<?php wp_reset_postdata(); ?>
					</div>
				</div>
			<?php endif; ?>
		</article>
		<aside class="col-lg-3 mobile-visually-hidden">
			<div class="sticky">
				<section class="widget follow-us">
					<h3 class="widget-title">suivez-nous</h3>
					<div class="follow-us__box">
						<a class="facebook" href="https://www.facebook.com/PepseeActus/" target="_blank">
							<p class="icon"><i class="fab fa-facebook"></i><span>103K</span></p>
						</a>
						<a class="youtube" href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank">
							<p class="icon"><i class="fab fa-youtube"></i><span>30K</span></p>
						</a>
						<a class="instagram" href="https://www.instagram.com/pepseeactus/" target="_blank">
							<p class="icon"><i class="fab fa-instagram"></i><span>5K</span></p>
						</a>
						<a class="soundcloud" href="https://soundcloud.com/pepsee" target="_blank">
							<p class="icon"><i class="fab fa-soundcloud"></i><span>2K</span></p>
						</a>
					</div>
				</section>
				<section class="widget instagram-feed">
					<?= do_shortcode("[instagram-feed]"); ?>
				</section>
				<?php $posts = get_field('artistes_associes');
				if ($posts): ?>
					<section class="artist">
						<h3 class="widget-title">Artiste<?= (count($posts) > 1) ? 's' : ''; ?></h3>
						<div class="artist__container">
							<?php foreach ($posts as $post) {
								$badge = get_field('compte_verifie'); ?>
								
								<div class="artist__container-box">
									<div class="artist-image">
										<a href="<?= get_the_permalink($post); ?>">
											<img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
										</a>
									</div>
									<div class="artist-info">
										<a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
										<?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
										<?php get_template_part( 'parts/reseaux-template' ); ?>
									</div>
								</div>
							<?php } ?>
							<?php wp_reset_postdata(); ?>
						</div>
					</section>
				<?php endif; ?>
				<div class="share">
					<?= do_shortcode("[scriptless buttons='facebook,twitter,whatsapp,pinterest,linkedin,email']"); ?>
				</div>
			</div>
		</aside>
	</div>
<?php endwhile; ?>

<?php
get_footer();
