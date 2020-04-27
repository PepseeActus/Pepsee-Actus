<?php
/**
 * The main template file
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package PepseeActus
 */

get_header(); ?>

<section class="d-flex justify-content-between mobile-visually-hidden">
	<?php
		$args = array(
			'cat' => '5'
		);
		
		$query = new WP_Query( $args );
		if ( $query->have_posts() ) {
			while ( $query->have_posts() ) {
				$query->the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class('col-4'); ?>>
					<div class="head-thumbnail">
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail( 'pepseeactus-ArtistsFront' ); ?>
						</a>
						<div class="post-infos">
							<div class="category"><?php the_category(', '); ?></div>
							<div class="post-title">
								<?php the_title( '<h3 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h3>' ); ?>
							</div>
							<div class="post-meta">
								<svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg> <?php echo meks_time_ago(); ?>
							</div>
						</div>
					</div>
				</article>

			<?php }
		}
	wp_reset_postdata(); ?>
</section>
<section class="releases">
	<div class="releases-head">
		<img src="<?= get_stylesheet_directory_uri(); ?>/assets/img/h2-frontpage.png">
	</div>
	<div class="big-title">
		<h2>Releases</h2>
		<a href="<?= get_post_type_archive_link('music'); ?>">Tout afficher</a>
	</div>
	<div class="releases-wrap">
		<?php
			$args = [
				'posts_per_page' => 12,
				'orderby' => 'date',
				'post_type' => 'music',
				'date_query' => [[
					'after' => ['year' => 2015],
					'inclusive' => true
				]],
			];
			
			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post();
					$artistes = get_field('artistes');
					$titre = get_field('titre'); ?>
					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a class="rotate" href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail( 'pepseeactus-Music' ); ?>
						</a>
						<div class="info">
							<h3 class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></h3>
							<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a></p>
						</div>
					</article>

				<?php }
			}
		wp_reset_postdata(); ?>
	</div>
</section>
<section class="classic margin-outside">
	<div class="big-title">
		<h2>Classics<span>(1990 - 2015)</span></h2>
		<a href="<?= get_post_type_archive_link('music'); ?>">Tout afficher</a>
	</div>
	<div class="classic-wrap">
		<?php
			$args = [
				'posts_per_page' => 12,
				'orderby' => 'date',
				'post_type' => 'music',
				'date_query' => [[
					'before' => ['year' => 2015],
					'inclusive' => true
				]],
			];

			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post();
					$artistes = get_field('artistes');
					$titre = get_field('titre'); ?>
					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a class="rotate" href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail( 'pepseeactus-Music' ); ?>
						</a>
						<div class="info">
							<h3 class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></h3>
							<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a></p>
							<p><?php the_date('Y'); ?></p>
						</div>
					</article>

				<?php }
			}
		wp_reset_postdata(); ?>
	</div>
</section>
<section class="album margin-outside">
	<div class="big-title">
		<h2>Albums & Mixtapes</h2>
		<a href="<?= get_post_type_archive_link('music'); ?>">Tout afficher</a>
	</div>
	<div class="album-wrap">
		<?php
			$args = array(
				'posts_per_page' => 12,
				'orderby' => 'date',
				'post_type' => 'album'
			);
			
			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post();
					$artistes = get_field('artistes');
					$titre = get_field('titre'); ?>
					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail( 'pepseeactus-Music' ); ?>
						</a>
						<div class="info">
							<h3 class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></h3>
							<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a></p>
							<p><?php the_date('Y'); ?></p>
						</div>
					</article>

				<?php }
			}
		wp_reset_postdata(); ?>
	</div>
</section>
<section class="videos margin-outside padding-inside">
	<div class="videos-nav">
		<ul>
			<li><a href="">Clips</a></li>
			<li><a href="">Connais-tu ce Riddim?</a></li>
			<li><a href="<?= get_category_link(15); ?>" class="see-more">Voir plus de videos</a></li>
			<script src="https://apis.google.com/js/platform.js"></script>
			<div class="g-ytsubscribe" data-channel="PepseeActus" data-layout="default" data-count="default"></div>
		</ul>
	</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<?php
			$args = array(
				'posts_per_page' => 5,
				'cat' => '15'
			);

			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post(); ?>
					<div class="swiper-slide">
						<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail( 'medium' ); ?></a>
						<a href="<?php the_permalink(); ?>"><svg height="100%" version="1.1" viewBox="0 0 68 48" width="100%"><path class="ytp-large-play-button-bg" d="M66.52,7.74c-0.78-2.93-2.49-5.41-5.42-6.19C55.79,.13,34,0,34,0S12.21,.13,6.9,1.55 C3.97,2.33,2.27,4.81,1.48,7.74C0.06,13.05,0,24,0,24s0.06,10.95,1.48,16.26c0.78,2.93,2.49,5.41,5.42,6.19 C12.21,47.87,34,48,34,48s21.79-0.13,27.1-1.55c2.93-0.78,4.64-3.26,5.42-6.19C67.94,34.95,68,24,68,24S67.94,13.05,66.52,7.74z" fill="#212121" fill-opacity="0.8"></path><path d="M 45,24 27,14 27,34" fill="#fff"></path></svg></a>
					</div>
				<?php }
			}
			wp_reset_postdata(); ?>
		</div>
		<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
		<div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
	</div>
</section>
<div class="wrapper row padding-inside">
	<section class="actus col-12 col-lg-9">
		<div class="big-title">
			<h2>Actus</h2>
			<a href="<?= get_category_link(5); ?>">Tout afficher</a>
		</div>
		<div class="actus-wrap">
			<?php
			$args = array(
				'posts_per_page' => 5,
				'orderby' => 'date',
				'cat' => '5'
			);
			
			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post(); ?>

					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<div class="overlay"></div>
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail( 'pepseeactus-ArtistsFront' ); ?>
						</a>
						<div class="actus-info">
							<div class="category"><?php the_category(', '); ?></div>
							<?php the_title( '<h3 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h3>' ); ?>
							<div class="post-meta mobile-visually-hidden">
								<div><svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg> <?php echo meks_time_ago(); ?></div>
							</div>
						</div>
					</article>

				<?php }
			}
			wp_reset_postdata(); ?>
		</div>
	</section>
	<?php get_sidebar(); ?>
</div>
<?php get_footer();
