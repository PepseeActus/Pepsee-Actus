<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package PepseeActus
 */

get_header();

while ( have_posts() ) : the_post();
	if ( '' != get_the_post_thumbnail() && !has_post_format( 'video' )) : ?>
		<div class="post-thumbnail">
			<?php the_post_thumbnail(); ?>
			<?php the_title( '<h3 class="single-title"><span>', '</span></h3>' ); ?>
		</div>
	<?php else : ?>
		<?php the_title( '<h2 class="single-title-clip">', '</h2>' ); ?>
	<?php endif; ?>
	<div class="row">
		<article id="post-<?php the_ID(); ?>" <?php post_class('background-white col-12 col-md-9'); ?>>
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
			</div>
			<div class="post-meta">
				Posté le <?php the_date(); ?>
				par <?php the_author(); ?>
			</div>
			<div id="graphcomment"></div>
		</article>
		<aside class="col-12 col-md-3">
			<?php $posts = get_field('artistes_associes');
			if ($posts): ?>
				<div class="artist">
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
		</aside>
	</div>
<?php endwhile; ?>

<?php
get_footer();
