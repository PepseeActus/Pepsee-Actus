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
			<h2>Nouveautés</h2>
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
							get_template_part( 'parts/front-music-template' );
						}
					}
				wp_reset_postdata(); ?>
			</div>
		</section>
	</div>
	<?php get_sidebar(); ?>
</div>

<section class="riddim margin-outside"></section>
	<h2>Riddims</h2>
	<div class="riddim-wrap">
		<?php $args = [
			'posts_per_page' => 12,
			'orderby' => 'date',
			'post_type' => 'riddim'
		];
		$query = new WP_Query( $args );
		if ( $query->have_posts() ) {
			while ( $query->have_posts() ) {
				$query->the_post();
				get_template_part( 'parts/front-album-template' );
			}
		}
		wp_reset_postdata(); ?>
	</div>
</section>

<section class="classic margin-outside">
	<h2>Classiques</h2>
	<div class="classic-wrap">
		<?php $args = [
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
				get_template_part( 'parts/front-music-template' );
			}
		}
		wp_reset_postdata(); ?>
	</div>
</section>

<section class="album margin-outside">
	<h2>Albums & Mixtapes</h2>
	<div class="album-wrap">
		<?php $args = [
			'posts_per_page' => 12,
			'orderby' => 'date',
			'post_type' => 'album'
		];
		$query = new WP_Query( $args );
		if ( $query->have_posts() ) {
			while ( $query->have_posts() ) {
				$query->the_post();
				get_template_part( 'parts/front-album-template' );
			}
		}
		wp_reset_postdata(); ?>
	</div>
</section>

<section class="artist margin-outside">
	<h2>Nouveaux artistes</h2>
	<div class="artist-wrap">
		<?php $args = array(
				'posts_per_page' => 5,
				'orderby' => 'date',
				'post_type' => 'artist'
			);
			
			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post(); ?>
					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a href="<?php the_permalink(); ?>">
							<?php the_post_thumbnail('thumbnail'); ?>
						</a>
						<div class="name">
							<a href="<?php the_permalink(); ?>" target="_blank"><?= get_the_title(); ?></a>
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
						</div>
					</article>
					<?php }
				}
				wp_reset_postdata(); ?>
			</div>
		</div>
	</div>
</section>

<?php get_footer();