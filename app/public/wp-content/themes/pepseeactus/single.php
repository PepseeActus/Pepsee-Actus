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
			<?php if ( '' != get_the_post_thumbnail() && !has_post_format( 'video' )) : ?>
				<div class="post-thumbnail">
					<?php the_post_thumbnail('large'); ?>
					<?php the_title( '<h3 class="single-title"><span>', '</span></h3>' ); ?>
				</div>
			<?php endif; ?>
			<?php $posts = get_field('artistes_associes');
			if ($posts): ?>
				<div class="artist desktop-visually-hidden">
					<h3 class="widget-title">Artiste<?= (count($posts) > 1) ? 's' : ''; ?></h3>
					<div class="artist__container">
						<?php foreach ($posts as $post) {
							$badge = get_field('compte_verifie');
							$twitter = get_field('twitter');
							$facebook = get_field('facebook');
							$instagram = get_field('instagram');
							$youtube = get_field('youtube'); ?>
							
							<div class="artist__container-box">
								<div class="artist-image">
									<a href="<?= get_the_permalink($post); ?>">
										<img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
									</a>
								</div>
								<div class="artist-info">
									<a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
									<?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
									<ul>
										<?= ($twitter) ? '<li><a href="'.$twitter.'" target="_blank"><i class="fab fa-twitter"></i></a></li>' : ''; ?>
										<?= ($instagram) ? '<li><a href="'.$instagram.'" target="_blank"><i class="fab fa-instagram"></i></a></li>' : ''; ?>
										<?= ($facebook) ? '<li><a href="'.$facebook.'" target="_blank"><i class="fab fa-facebook-f"></i></a></li>' : ''; ?>
										<?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><i class="fab fa-youtube"></i></a></li>' : ''; ?>
									</ul>
								</div>
							</div>
						<?php } ?>
						<?php wp_reset_postdata(); ?>
					</div>
				</div>
			<?php endif; ?>
			<div class="single-content">
				<?php if (! has_post_format( 'video' )) { ?>
					<div class="post-meta">
						<?php the_author(); ?>, le <?php the_date(); ?>
						<div><i class="fa fa-eye"></i><?php if (function_exists('the_views')) {the_views();} ?></div>
					</div>
				<?php } ?>
				<?php if (has_post_format( 'video' )) { ?>
					<div class="clip-box">
						<?php 
							the_title( '<h3 class="single-title"><span>', '</span></h3>' );
							the_content();
						?>
					</div>
				<?php } else {
					the_content( sprintf(
						/* translators: %s: Name of current post. */
						wp_kses( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'pepseeactus' ), array( 'span' => array( 'class' => array() ) ) ),
						the_title( '<span class="screen-reader-text">"', '"</span>', false )
					) );
		
					wp_link_pages( array(
						'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'pepseeactus' ),
						'after'  => '</div>',
					) );
				} ?>
			</div>
			<div id="graphcomment"></div>
		</article>
		<aside class="col-lg-3 padding-inside mobile-visually-hidden">
			<section class="widget follow-us">
				<h3 class="widget-title">suivez-nous</h3>
				<div class="follow-us__box">
					<a class="facebook" href="https://www.facebook.com/PepseeActus/" target="_blank">
						<p class="icon"><i class="fab fa-facebook"></i><span>100K</span></p>
					</a>
					<a class="youtube" href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank">
						<p class="icon"><i class="fab fa-youtube"></i><span>25K</span></p>
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
							$badge = get_field('compte_verifie');
							$twitter = get_field('twitter');
							$facebook = get_field('facebook');
							$instagram = get_field('instagram');
							$youtube = get_field('youtube'); ?>
							
							<div class="artist__container-box">
								<div class="artist-image">
									<a href="<?= get_the_permalink($post); ?>">
										<img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
									</a>
								</div>
								<div class="artist-info">
									<a class="artist-title" href="<?= get_the_permalink($post); ?>"><?= get_the_title($post); ?></a>
									<?php if ($badge) echo '<i class="fas fa-check-circle"></i>'; ?>
									<ul>
										<?= ($twitter) ? '<li><a href="'.$twitter.'" target="_blank"><i class="fab fa-twitter"></i></a></li>' : ''; ?>
										<?= ($instagram) ? '<li><a href="'.$instagram.'" target="_blank"><i class="fab fa-instagram"></i></a></li>' : ''; ?>
										<?= ($facebook) ? '<li><a href="'.$facebook.'" target="_blank"><i class="fab fa-facebook-f"></i></a></li>' : ''; ?>
										<?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank"><i class="fab fa-youtube"></i></a></li>' : ''; ?>
									</ul>
								</div>
							</div>
						<?php } ?>
						<?php wp_reset_postdata(); ?>
					</div>
				</section>
			<?php endif; ?>
		</aside>
	</div>
<?php endwhile; ?>

<?php
get_footer();
