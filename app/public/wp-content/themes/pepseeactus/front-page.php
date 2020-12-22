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

<section class="d-flex justify-content-between mobile-visually-hidden headerThumbnail">
	<?php
		$args = [
			'cat' => [5, 126],
			'posts_per_page' => 3
		];
		
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
				<div class="category"><?php the_category(' '); ?></div>
				<div class="post-title">
					<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
				</div>
			</div>
		</div>
	</article>

	<?php }
		}
	wp_reset_postdata(); ?>
</section>
<div class="wrapper row padding-inside">
	<div class="principal col-12 col-lg-9">
		<section class="releases">
			<div>
				<h2>Nouveautés</h2>
			</div>
			<div class="releases-wrap">
				<?php
					$args = [
						'posts_per_page' => 14,
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
							$titre = get_field('titre');
							$riddim = get_field('riddim');
							$download = get_field('download'); ?>
				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
					<?php $weekAgo = strtotime('-1 week'); ?>
					<a class="rotate" href="<?php the_permalink(); ?>">
						<?php the_post_thumbnail('thumbnail'); ?>
					</a>
					<div class="info">
						<div class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a>
					</div>
						<p>
							<a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a>
							<?php if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
								<span class="new"><svg class="widget__icon" width="39.45" height="49.68"
									viewBox="0 0 39.45 49.68">
									<path
										d="M26.46 10.38c.5 1.07 5.53 11.36 1.22 10.54C23.38 20.1 17 7.56 17.8 0c0 0-8.14 6.08-6.64 15.02 1.5 8.94 3.63 15.54-2 15.32-5.66-.22-2.44-7.1-1.26-10.4-9.42 5.57-8 14.9-7.55 18 .38 2.57 1.57 8.57 8 11 9.8 2.15 13.64-14.08 13.3-19.52 2.67 3.15 4.4 7.57 4.05 10.5-.7 5.7-5.5 10.22-.9 9.72 6.95-.76 12.07-4.12 13.98-12.7 2.08-9.36-.3-20.86-12.32-26.56">
									</path>
								</svg> NEW</span>
							<?php endif; ?>
						</p>
						<?= ($riddim) ? '<p class="riddim">'.$riddim.' Riddim</p>' : ''; ?>
						<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
											<path d="m363,373.1h-60.2v-140.1c0-5.8-4.7-10.4-10.4-10.4h-72.8c-5.8,0-10.4,4.7-10.4,10.4v140.1h-60.2c-12.6,0.8-12,14.5-7.4,17.8l107,107c2.1,2.2 8.6,5.7 14.7,0l107-107c5-4.6 4.8-16.9-7.3-17.8zm-107,102.7l-81.8-81.8h45.4c5.8,0 10.4-4.7 10.4-10.4v-140.2h51.9v140.1c0,5.8 4.7,10.4 10.4,10.4h45.5l-81.8,81.9z"/>
											<path d="m384.2,129.1c-5.4-66-60.8-118.1-128.2-118.1s-122.8,52.1-128.2,118.1c-1.42109e-14,0-105.6-4.2-105.6,99.8 0,53.6 44.8,99.8 99.8,99.8h67.7c5.8,0 10.4-4.7 10.4-10.4s-4.7-10.4-10.4-10.4h-67.7c-43.5,0-78.9-35.4-78.9-79 0-43.5 34.4-78.5 78.9-79 7.1-0.1 26.2,4.3 26.2-10.4 0-59.4 48.3-107.7 107.7-107.7 59.4,0 107.7,48.3 107.7,107.7 0,14.3 19.2,10.4 26.2,10.4 43.1,0.3 79,35.4 79,79 0,43.5-35.4,79-79,79h-67.7c-5.8,0-10.4,4.7-10.4,10.4s4.7,10.4 10.4,10.4h67.7c55,0 99.8-45.7 99.8-99.8 0.1-102.7-105.4-99.8-105.4-99.8z"/>
										</svg>
										Télécharger
									</a>' : ''; ?>
					</div>
				</article>
				<?php }
					}
				wp_reset_postdata(); ?>
			</div>
		</section>
	</div>
	<?php get_sidebar(); ?>
</div>
<section class="classic margin-outside">
	<div>
		<h2>Classiques</h2>
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
			<?php $weekAgo = strtotime('-1 week'); ?>
			<a class="rotate" href="<?php the_permalink(); ?>">
				<?php the_post_thumbnail('thumbnail'); ?>
			</a>
			<div class="info">
				<div class="title">
					<a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a>
					<?php if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
					<span class="new"><svg class="widget__icon" width="39.45" height="49.68" viewBox="0 0 39.45 49.68">
							<path
								d="M26.46 10.38c.5 1.07 5.53 11.36 1.22 10.54C23.38 20.1 17 7.56 17.8 0c0 0-8.14 6.08-6.64 15.02 1.5 8.94 3.63 15.54-2 15.32-5.66-.22-2.44-7.1-1.26-10.4-9.42 5.57-8 14.9-7.55 18 .38 2.57 1.57 8.57 8 11 9.8 2.15 13.64-14.08 13.3-19.52 2.67 3.15 4.4 7.57 4.05 10.5-.7 5.7-5.5 10.22-.9 9.72 6.95-.76 12.07-4.12 13.98-12.7 2.08-9.36-.3-20.86-12.32-26.56">
							</path>
						</svg> NEW</span>
					<?php endif; ?>
				</div>
				<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?> - <?php the_date('Y'); ?></a></p>
				<?php $download = get_field('download'); ?>
				<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
											<path d="m363,373.1h-60.2v-140.1c0-5.8-4.7-10.4-10.4-10.4h-72.8c-5.8,0-10.4,4.7-10.4,10.4v140.1h-60.2c-12.6,0.8-12,14.5-7.4,17.8l107,107c2.1,2.2 8.6,5.7 14.7,0l107-107c5-4.6 4.8-16.9-7.3-17.8zm-107,102.7l-81.8-81.8h45.4c5.8,0 10.4-4.7 10.4-10.4v-140.2h51.9v140.1c0,5.8 4.7,10.4 10.4,10.4h45.5l-81.8,81.9z"/>
											<path d="m384.2,129.1c-5.4-66-60.8-118.1-128.2-118.1s-122.8,52.1-128.2,118.1c-1.42109e-14,0-105.6-4.2-105.6,99.8 0,53.6 44.8,99.8 99.8,99.8h67.7c5.8,0 10.4-4.7 10.4-10.4s-4.7-10.4-10.4-10.4h-67.7c-43.5,0-78.9-35.4-78.9-79 0-43.5 34.4-78.5 78.9-79 7.1-0.1 26.2,4.3 26.2-10.4 0-59.4 48.3-107.7 107.7-107.7 59.4,0 107.7,48.3 107.7,107.7 0,14.3 19.2,10.4 26.2,10.4 43.1,0.3 79,35.4 79,79 0,43.5-35.4,79-79,79h-67.7c-5.8,0-10.4,4.7-10.4,10.4s4.7,10.4 10.4,10.4h67.7c55,0 99.8-45.7 99.8-99.8 0.1-102.7-105.4-99.8-105.4-99.8z"/>
										</svg>
										Télécharger
									</a>' : ''; ?>
			</div>
		</article>

		<?php }
					}
				wp_reset_postdata(); ?>
	</div>
</section>
<section class="album margin-outside">
	<div>
		<h2>Albums & Mixtapes</h2>
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
			<?php $weekAgo = strtotime('-1 week'); ?>
			<a href="<?php the_permalink(); ?>">
				<?php the_post_thumbnail('thumbnail'); ?>
			</a>
			<div class="info">
				<div class="title">
					<a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a>
					<?php if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
					<span class="new"><svg class="widget__icon" width="39.45" height="49.68" viewBox="0 0 39.45 49.68">
							<path
								d="M26.46 10.38c.5 1.07 5.53 11.36 1.22 10.54C23.38 20.1 17 7.56 17.8 0c0 0-8.14 6.08-6.64 15.02 1.5 8.94 3.63 15.54-2 15.32-5.66-.22-2.44-7.1-1.26-10.4-9.42 5.57-8 14.9-7.55 18 .38 2.57 1.57 8.57 8 11 9.8 2.15 13.64-14.08 13.3-19.52 2.67 3.15 4.4 7.57 4.05 10.5-.7 5.7-5.5 10.22-.9 9.72 6.95-.76 12.07-4.12 13.98-12.7 2.08-9.36-.3-20.86-12.32-26.56">
							</path>
						</svg> NEW</span>
					<?php endif; ?>
				</div>
				<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?> - <?php the_date('Y'); ?></a></p>
				<?php $download = get_field('download'); ?>
				<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
											<path d="m363,373.1h-60.2v-140.1c0-5.8-4.7-10.4-10.4-10.4h-72.8c-5.8,0-10.4,4.7-10.4,10.4v140.1h-60.2c-12.6,0.8-12,14.5-7.4,17.8l107,107c2.1,2.2 8.6,5.7 14.7,0l107-107c5-4.6 4.8-16.9-7.3-17.8zm-107,102.7l-81.8-81.8h45.4c5.8,0 10.4-4.7 10.4-10.4v-140.2h51.9v140.1c0,5.8 4.7,10.4 10.4,10.4h45.5l-81.8,81.9z"/>
											<path d="m384.2,129.1c-5.4-66-60.8-118.1-128.2-118.1s-122.8,52.1-128.2,118.1c-1.42109e-14,0-105.6-4.2-105.6,99.8 0,53.6 44.8,99.8 99.8,99.8h67.7c5.8,0 10.4-4.7 10.4-10.4s-4.7-10.4-10.4-10.4h-67.7c-43.5,0-78.9-35.4-78.9-79 0-43.5 34.4-78.5 78.9-79 7.1-0.1 26.2,4.3 26.2-10.4 0-59.4 48.3-107.7 107.7-107.7 59.4,0 107.7,48.3 107.7,107.7 0,14.3 19.2,10.4 26.2,10.4 43.1,0.3 79,35.4 79,79 0,43.5-35.4,79-79,79h-67.7c-5.8,0-10.4,4.7-10.4,10.4s4.7,10.4 10.4,10.4h67.7c55,0 99.8-45.7 99.8-99.8 0.1-102.7-105.4-99.8-105.4-99.8z"/>
										</svg>
										Télécharger
									</a>' : ''; ?>
			</div>
		</article>

		<?php }
					}
				wp_reset_postdata(); ?>
	</div>
</section>
<section class="actus">
	<div class="actus-wrap">
		<h2>Actus</h2>
		<div class="swiper-container swiper-container-actus">
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
				<?php
				$args = array(
					'posts_per_page' => 9,
					'orderby' => 'date',
					'cat' => [5, 126]
				);
				$query = new WP_Query( $args );
				if ( $query->have_posts() ) {
					while ( $query->have_posts() ) {
						$query->the_post(); 
						$categories = get_the_category();
				?>
					<!-- Slides -->
					<article id="post-<?php the_ID(); ?>" <?php post_class("swiper-slide"); ?>>
						<a href="<?php the_permalink(); ?>">
							<div class="thumbnail-wrapper">
								<?php the_post_thumbnail('large'); ?>
							</div>
						</a>
						<div class="<?= $categories[0]->slug; ?>-info">
							<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
							<?php the_excerpt(); ?>
						</div>
					</article>
					<?php }
				}
				wp_reset_postdata(); ?>
			</div>
		</div>
	</div>
	<div class="clips-wrap mobile-visually-hidden">
		<h2>Clips</h2>
		<div class="swiper-container swiper-container-clips">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<?php
				$args = array(
					'posts_per_page' => 9,
					'orderby' => 'date',
					'cat' => 15
				);
				$query = new WP_Query( $args );
				if ( $query->have_posts() ) {
					while ( $query->have_posts() ) {
						$query->the_post(); 
						$categories = get_the_category();
				?>
					<!-- Slides -->
					<article id="post-<?php the_ID(); ?>" <?php post_class("swiper-slide"); ?>>
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail('large'); ?>
						</a>
						<div class="clips-info">
							<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
						</div>
					</article>
					<?php }
				}
				wp_reset_postdata(); ?>
			</div>
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
		</div>
	</div>
</section>
<?php get_footer();