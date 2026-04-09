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
	<link rel="shortcut icon" type="image/x-icon" href="<?= get_stylesheet_directory_uri(); ?>/assets/img/favicon.png" />
	<meta name="google-site-verification" content="uJB9Bwu2CBP51oVqZkoiu76HxCTm1Y-931hu8k1wiR4" />
	<?php wp_head(); ?>
</head>

<body <?php body_class('js'); ?>>
	<!-- Scrollbar -->
	<div id="progressbar"></div>
	<div id="scrollPath"></div>
	<header class="site-header" role="banner">
		<div class="container">
			<nav>
				<div class="desktop-visually-hidden">
					<div id="navbar">
						<svg width="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M4 17H20M4 12H20M4 7H20" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>
				</div>
				<div class="logo">
					<a href="<?= site_url(); ?>" class="brand"><span>Pepsee</span>Actus</a>
				</div>
				<div class="nav-wrapper">
					<ul>
						<li class="search-trigger">
							<button type="button" class="search-trigger__button js-search-trigger" aria-label="Ouvrir la recherche">
								<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 488.4 488.4" xml:space="preserve">
									<g>
										<g>
											<path d="M0,203.25c0,112.1,91.2,203.2,203.2,203.2c51.6,0,98.8-19.4,134.7-51.2l129.5,129.5c2.4,2.4,5.5,3.6,8.7,3.6
												s6.3-1.2,8.7-3.6c4.8-4.8,4.8-12.5,0-17.3l-129.6-129.5c31.8-35.9,51.2-83,51.2-134.7c0-112.1-91.2-203.2-203.2-203.2
												S0,91.15,0,203.25z M381.9,203.25c0,98.5-80.2,178.7-178.7,178.7s-178.7-80.2-178.7-178.7s80.2-178.7,178.7-178.7
												S381.9,104.65,381.9,203.25z"/>
										</g>
									</g>
								</svg>
							</button>
						</li>
						<li class="mobile-visually-hidden <?php if (is_front_page()) echo 'current-menu-item'; ?>"><a href="<?= site_url(); ?>">Home</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'music') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('music'); ?>">Singles</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'riddim') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('riddim'); ?>">Riddims</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'album') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('album'); ?>">Albums</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'artist') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('artist'); ?>">Artistes</a></li>
						<li class="mobile-visually-hidden <?php if (get_post_type() == 'beatmaker') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('beatmaker'); ?>">Beatmakers</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<?php 

	//HOME
	if (is_front_page()) : ?>
		<div class="hero-banner">
			<section class="header-actus">
				<div class="post-title">
					<h1>Le meilleur de la<br>French Caribbean Music.</h1>
					<p>Découvres la plus grosse base de données<br>de sons Dancehall Lokal</p>
					<p>Dancehall | Shatta | Soca | Bouyon | Afro</p>
					<?php
						$counts = get_custom_post_counts();

						echo '<p><b>PepseeActus</b> cherche à répertorier chaque acteur qui fait avancer la musique urbaine des Antilles Guyane française. Nous contenons dans notre base de données <b>' 
							. $counts['music']['total'] . '</b> musiques, <b>' 
							. $counts['album']['total'] . '</b> albums, <b>' 
							. $counts['riddim']['total'] . '</b> Riddims, <b>' 
							. $counts['beatmaker']['total'] . '</b> beatmakers et <b>' 
							. $counts['artist']['total'] . '</b> artistes.</p>';
						
						echo '<p>Depuis le début de l\'année 2026, <b>' 
							. $counts['music']['since_2025'] . '</b> musiques ont été ajoutées sur PepseeActus, <b>' 
							. $counts['album']['since_2025'] . '</b> albums, <b>' 
							. $counts['riddim']['since_2025'] . '</b> Riddims, <b>' 
							. $counts['beatmaker']['since_2025'] . '</b> beatmakers et <b>' 
							. $counts['artist']['since_2025'] . '</b> artistes.</p>';
					?>
				</div>
				<div>
					<?php get_template_part( 'parts/social-stat' ); ?>
				</div>
			</section>
		</div>
	<?php endif;

	if ( function_exists('yoast_breadcrumb') && !is_front_page()) {
		yoast_breadcrumb( '<p class="container" id="breadcrumbs">','</p>' );
	}
	?>

	<main class="container">
