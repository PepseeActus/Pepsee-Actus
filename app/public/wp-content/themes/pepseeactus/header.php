<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package PepseeActus
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-49685610-1"></script>
	<!-- Pinterest -->
	<meta name="p:domain_verify" content="7c0bae2cf0019086bbedd32c8b902c9d"/>
	<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());

	gtag('config', 'UA-49685610-1');
	</script>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,600,700,900" rel="stylesheet">
	<link rel="shortcut icon" type="image/x-icon" href="<?= get_stylesheet_directory_uri(); ?>/assets/img/favicon.png" />
	<?php wp_head(); ?>
</head>

<body <?php body_class('js'); ?>>
	<!-- Scrollbar -->
	<div id="progressbar"></div>
	<div id="scrollPath"></div>
	<?php if (is_page('/a-propos/contact/')) : ?>
		<!-- Load Facebook SDK for JavaScript -->
		<div id="fb-root"></div>
		<script>
			window.fbAsyncInit = function() {
			FB.init({
				xfbml            : true,
				version          : 'v7.0'
			});
			};

			(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = 'https://connect.facebook.net/fr_FR/sdk/xfbml.customerchat.js';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>

		<!-- Your customer chat code -->
		<div class="fb-customerchat"
			attribution=setup_tool
			page_id="111027715584406">
		</div>
	<?php endif; ?>
	<header class="site-header" role="banner">
		<div class="container">
			<nav>
				<div class="logo">
					<a href="<?= site_url(); ?>" class="brand"><span>Pepsee</span>Actus</a>
				</div>
				<div class="nav-wrapper">
					<ul>
						<li class="search-trigger js-search-trigger"><i class="fa fa-search" aria-hidden="true"></i></li>
						<li class="mobile-visually-hidden <?php if (is_front_page()) echo 'current-menu-item'; ?>"><a href="<?= site_url(); ?>">Home</a></li>
						<li class="mobile-visually-hidden <?php if (is_category('actus')) echo 'current-menu-item'; ?>"><a href="<?= site_url('/actus'); ?>">Actus</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'music') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('music'); ?>">Singles</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'riddim') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('riddim'); ?>">Riddims</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'album') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('album'); ?>">Albums</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'artist') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('artist'); ?>">Artistes</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'beatmaker') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('beatmaker'); ?>">Beatmakers</a></li>
						<li class="mobile-visually-hidden <?php if (is_page('a-propos')) echo 'current-menu-item'; ?>"><a href="<?= site_url('/a-propos'); ?>">A propos</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<?php 

	//HOME
	if (is_front_page() || is_page()) :

		if (is_page() && !is_front_page()) : ?>
			<div class="hero-banner" style='background-image: url("<?= get_stylesheet_directory_uri(); ?>/assets/img/pepseenewbanner_gris_nologo.jpg")'>
				<img src="<?= get_stylesheet_directory_uri(); ?>/assets/img/pepseelogo_png.png" alt="logo PepseeActus" class="headerLogo">
			</div>
		<?php endif;

		if (is_front_page()) :
			$args = [
				'posts_per_page' => 1,
				'orderby' => 'date',
				'post_type' => 'banner'
			];

			$query = new WP_Query($args);
			if ( $query->have_posts() ) {
				while ( $query->have_posts() ) :
					$query->the_post();
					$image_banner = get_field('image_banner');
					$link = get_field('link');
					$artiste = get_field('artiste');
					$album = get_field('album');
					$youtube_id = get_field('youtube_id'); ?>

					<div class="hero-banner" style='background-image: url("<?= $image_banner['url']; ?>'>
						<div class="video-background">
							<div class="video-foreground">
								<iframe src="https://www.youtube.com/embed/<?= $youtube_id; ?>?autoplay=1&loop=1&mute=1&playlist=<?= $youtube_id; ?>"
										frameborder="0"
										allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen>
								</iframe>
							</div>
						</div>
						<div class="banner-info">
							<p class="name"><?= $artiste; ?></p>
							<p class="album"><?= $album; ?></p>
							<?php the_content(); ?>
							<button><a target="_blank" href="<?= $link; ?>">Acheter l'album</a></button>
						</div>
						<div class="banner-more">
							<div class="artist-image">
								<a href="<?= $link; ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
							</div>
						</div>
					</div>

				<?php endwhile;
				wp_reset_postdata();
			} else { ?>
				<div class="hero-banner">
					<!-- PROMOTION BANNER -->
						<!--<div class="hero-banner-background">
							<?php $detect = new Mobile_Detect();
							if ( $detect->isMobile() ) {
								// Featured image for mobile users
								$featured_image = get_stylesheet_directory_uri() . "/assets/img/pa_doute_mobile.jpg";
							} else {
								// Featured image for all other users
								$featured_image = get_stylesheet_directory_uri() . "/assets/img/pa_doute_pepsee.jpg";
							} ?>
							<img src="<?= $featured_image; ?>" alt="header banner"/>
						</div>-->
					<!-- CLASSIC HEADER -->
					<section class="header-actus container">
						<?php
							$args = [
								'post_type' => 'music',
								'posts_per_page' => 10
							];

							$query = new WP_Query( $args ); ?>

							<div class="header-section">
								<div class="post-title">
									<h2>Le meilleur de la<br>French Caribbean Music.</h2>
								</div>
								<div class="swiper-container swiper-header">
									<div class="swiper-wrapper">

										<?php if ( $query->have_posts() ) :
											while ( $query->have_posts() ) :
												$query->the_post(); ?>

												<div id="post-<?php the_ID(); ?>" class="post-thumbnail swiper-slide">
													<a href="<?php the_permalink(); ?>">
														<div class="thumbnail-wrapper">
															<?php the_post_thumbnail('large'); ?>
														</div>
													</a>
												</div>

											<? endwhile;
										endif;
										wp_reset_postdata(); ?>

									</div>
									<div class="swiper-pagination"></div>
								</div>
							</div>
					</section>
				</div>

			<?php }
		endif;
	endif; ?>

	<?php
	if ( function_exists('yoast_breadcrumb') && !is_front_page()) {
		yoast_breadcrumb( '<p class="container" id="breadcrumbs">','</p>' );
	}
	?>

	<main class="container">