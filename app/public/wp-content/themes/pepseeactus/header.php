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

<body <?php body_class(); ?>>
	<header class="site-header" role="banner">
		<div class="container">
			<nav>
				<div class="logo">
					<a href="<?= site_url(); ?>" class="brand"><span>PEPSEE</span>ACTUS</a>
				</div>
				<div class="nav-wrapper">
					<ul>
						<li class="search-trigger js-search-trigger"><i class="fa fa-search" aria-hidden="true"></i></li>
						<li <?php if (is_front_page()) echo 'class="current-menu-item"'; ?>><a href="<?= site_url(); ?>">Home</a></li>
						<li <?php if (get_post_type() == 'music') echo 'class="current-menu-item"'; ?>><a href="<?= get_post_type_archive_link('music'); ?>">Musique</a></li>
						<li <?php if (get_post_type() == 'artist') echo 'class="current-menu-item"'; ?>><a href="<?= get_post_type_archive_link('artist'); ?>">Artistes</a></li>
						<li class="mobile-visually-hidden <?php if (is_page('/a-propos')) echo 'current-menu-item'; ?>"><a href="<?= site_url('/a-propos'); ?>">A propos</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<?php 
	$pageBanner = get_field('image_arriere_plan');
	$pageBannerImage = $pageBanner['url'];

	if ((get_post_type() == 'artist') && $pageBannerImage) : ?>
		<div class="hero-banner" style='background-image: radial-gradient(ellipse closest-side, rgba(0, 0, 0, 0.5), #100e17), url("<?= $pageBannerImage; ?>")'>
	<?php else : ?>
		<div class="hero-banner" style='background-image: url("<?= get_stylesheet_directory_uri(); ?>/assets/img/88891.jpg")'>
	<?php endif; ?>
	</div>

	<?php
	if ( function_exists('yoast_breadcrumb') && !is_front_page()) {
		yoast_breadcrumb( '<p class="container" id="breadcrumbs">','</p>' );
	}
	?>

	<main class="container">