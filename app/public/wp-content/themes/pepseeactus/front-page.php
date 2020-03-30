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
								<i class="fas fa-clock"></i> <?php echo meks_time_ago(); ?>
							</div>
						</div>
					</div>
				</article>

			<?php }
		}
	wp_reset_postdata(); ?>
</section>
<div class="wrapper row">
	<div class="col-12 col-lg-9">
		<section class="releases">
			<div class="big-title">
				<h2>Releases</h2>
				<a href="<?= get_post_type_archive_link('music'); ?>">Tout afficher</a>
			</div>
			<div class="releases-wrap">
				<?php
					$args = array(
						'posts_per_page' => 12,
						'orderby' => 'date',
						'post_type' => ['music', 'album']
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
								<div class="releases-info">
									<h3 class="entry-title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></h3>
									<p><a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a></p>
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
								<div><i class="fas fa-clock"></i> <?php echo meks_time_ago(); ?></div>
							</div>
						</div>
					</article>

				<?php }
			}
			wp_reset_postdata(); ?>
		</div>
	</section>
	<div class="clips col-12 col-lg-3">
		<h2>Clips</h2>
		<div class="clips-wrap">
			<?php
			$args = array(
				'posts_per_page' => 5,
				'cat' => '15'
			);
			
			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post(); ?>
			
					<article>
						<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail( 'medium' ); ?></a>
						<a href="<?php the_permalink(); ?>"><i class="far fa-play-circle"></i></a>
					</article>
			
				<?php }
			}
			wp_reset_postdata(); ?>
			<a href="<?= get_category_link(15); ?>" class="see-more">Voir plus de clips</a>
		</div>
	</div>
</div>
<section class="artists padding-inside">
	<div class="big-title">
		<h2>Artistes</h2>
		<a href="<?= get_post_type_archive_link('artist'); ?>">Tout afficher</a>
	</div>
	<div class="artists-wrap">
		<?php
			$args = array(
				'posts_per_page' => 4,
				'orderby' => 'date',
				'post_type' => 'artist'
			);

			$query = new WP_Query( $args );
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) {
					$query->the_post(); ?>

					<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail( 'pepseeactus-ArtistsFront' ); ?></a>
					</article>

				<?php }
			}
		wp_reset_postdata(); ?>
	</div>
</section>

<?php get_footer();
