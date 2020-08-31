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
		$args = [
			'cat' => '5',
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
							<div class="category"><?php the_category(', '); ?></div>
							<div class="post-title">
								<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
							</div>
							<div class="post-meta">
								<svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg>
								<?php echo meks_time_ago(); ?>
								<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();} ?>
							</div>
						</div>
					</div>
				</article>

			<?php }
		}
	wp_reset_postdata(); ?>
</section>

<div class="wrapper row padding-inside">
	<div class="principal col-12 col-lg-9 padding-inside">
		<section class="releases">
			<div class="releases-head">
				<img src="<?= get_stylesheet_directory_uri(); ?>/assets/img/h2-frontpage.png">
			</div>
			<div>
				<h2>Nouveautés</h2>
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
							$titre = get_field('titre');
							$riddim = get_field('riddim');
							$download = get_field('download'); ?>
							<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
								<?php 
								$weekAgo = strtotime('-1 week');
								if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
									<span class="new">new</span>
								<?php endif; ?>
								<a class="rotate" href="<?php the_permalink(); ?>">
									<?php the_post_thumbnail('thumbnail'); ?>
								</a>
								<div class="info">
									<div class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></div>
									<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a></p>
									<?= ($riddim) ? '<p class="riddim">'.$riddim.' Riddim</p>' : ''; ?>
									<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank"><i class="fa fa-cloud-download"></i> Free</a>' : ''; ?>
								</div>
							</article>
						<?php }
					}
				wp_reset_postdata(); ?>
			</div>
		</section>
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
								<?php 
								$weekAgo = strtotime('-1 week');
								if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
									<span class="new">new</span>
								<?php endif; ?>
								<a class="rotate" href="<?php the_permalink(); ?>">
									<?php the_post_thumbnail('thumbnail'); ?>
								</a>
								<div class="info">
									<div class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></div>
									<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?> - <?php the_date('Y'); ?></a></p>
									<?php $download = get_field('download'); ?>
									<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank"><i class="fa fa-cloud-download"></i> Download</a>' : ''; ?>
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
								<?php 
								$weekAgo = strtotime('-1 week');
								if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
									<span class="new">new</span>
								<?php endif; ?>
								<a href="<?php the_permalink(); ?>">
									<?php the_post_thumbnail('thumbnail'); ?>
								</a>
								<div class="info">
									<div class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></div>
									<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?> - <?php the_date('Y'); ?></a></p>
									<?php $download = get_field('download'); ?>
									<?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank"><i class="fa fa-cloud-download"></i> Download</a>' : ''; ?>
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

<section class="actus padding-inside">
	<div>
		<h2>Actus</h2>
	</div>
	<div class="actus-wrap">
		<?php
		$args = array(
			'posts_per_page' => 9,
			'orderby' => 'date',
			'cat' => 5
		);
		
		$query = new WP_Query( $args );
		if ( $query->have_posts() ) {
			while ( $query->have_posts() ) {
				$query->the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
				<a href="<?php the_permalink(); ?>">
					<?php the_post_thumbnail('large'); ?>
				</a>
				<div class="actus-info">
						<div class="category"><?php the_category(', '); ?></div>
						<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
						<div class="post-meta mobile-visually-hidden">
							<div>
								<svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg>
								<?php echo meks_time_ago(); ?>
								<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();} ?>
							</div>
						</div>
					</div>
				</article>

			<?php }
		}
		wp_reset_postdata(); ?>
	</div>
	<div class="clips-wrap mobile-visually-hidden">
		<?php
		$args = array(
			'posts_per_page' => 9,
			'orderby' => 'date',
			'cat' => 15
		);
		
		$query = new WP_Query( $args );
		if ( $query->have_posts() ) {
			while ( $query->have_posts() ) {
				$query->the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
				<a href="<?php the_permalink(); ?>">
					<?php the_post_thumbnail('large'); ?>
				</a>
				<div class="clips-info">
						<div class="category"><?php the_category(', '); ?></div>
						<?php the_title( '<div class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></div>' ); ?>
						<div class="post-meta mobile-visually-hidden">
							<div>
								<svg class="icon icon-date" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="img" focusable="false"><rect x="0" fill="none" width="16" height="16"></rect><g><path d="M12 3h-1V2H9v1H7V2H5v1H4c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 8H8V6.2l-.8.3-.4-1L9 4.8V11z"></path></g></svg>
								<?php echo meks_time_ago(); ?>
								<i class="fa fa-eye"></i> <?php if (function_exists('the_views')) {the_views();} ?>
							</div>
						</div>
					</div>
				</article>

			<?php }
		}
		wp_reset_postdata(); ?>
	</div>
</section>
<?php get_footer();
