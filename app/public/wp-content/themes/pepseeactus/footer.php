<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package PepseeActus
 */

?>
			</main>
			<div class="playlist-nav">
				<a href="https://open.spotify.com/user/21b27shenyft7hkmfguizsl5q" target="_blank" rel="noopener noreferrer"><i class="fab fa-spotify"></i></a>
				<a href="https://soundcloud.com/pepsee/sets" target="_blank" rel="noopener noreferrer"><i class="fab fa-soundcloud"></i></a>
				<a href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank" rel="noopener noreferrer"><i class="fab fa-youtube"></i></a>
				<a href="#" target="_blank" rel="noopener noreferrer"><i class="fab fa-apple"></i></a>
			</div>
			<footer class="site-footer">
				<div class="footer-wrap">
					<div class="footer-section-1 col-4">
						<p>L'univers Reggae Dancehall des Antilles françaises.</p>
					</div>
					<div class="footer-section-menu col-4">
						<ul>
							<li><a href="<?= site_url(); ?>"><span>Home</span></a></li>
							<li><a href="<?= site_url('/download'); ?>"><span>Musique</span></a></li>
							<li><a href="<?= site_url('/artistes'); ?>"><span>Artistes</span></a></li>
							<li><a href="<?= site_url('/actus'); ?>"><span>Actus</span></a></li>
						</ul>
					</div>
					<div class="footer-section-rgpd col-4">
						<ul>
							<li><a href="<?= site_url('/a-propos'); ?>"><span>À propos</span></a></li>
							<li><a href="<?= site_url('/a-propos/contact'); ?>"><span>Contact</span></a></li>
							<li><a href="<?= site_url('/publicite'); ?>"><span>Publicité</span></a></li>
							<li><a href="<?= site_url('/mentions-legales'); ?>"><span>Mentions légales</span></a></li>
						</ul>
					</div>
				</div>
				<div class="site-info">PepseeActus since 2010 ©Copyright 2010-<?= date("Y"); ?></div>

				<!-- back to top -->
				<a id="button"></a>
				
				<!-- about -->
				<div class="about">
					<a class="bg_links social facebook" href="https://www.facebook.com/PepseeActus/" target="_blank">
						<span class="icon"><i class="fab fa-facebook"></i></span>
					</a>
					<a class="bg_links social youtube" href="https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ" target="_blank">
						<span class="icon"><i class="fab fa-youtube"></i></span>
					</a>
					<a class="bg_links social instagram" href="https://www.instagram.com/pepseeactus/" target="_blank">
						<span class="icon"><i class="fab fa-instagram"></i></span>
					</a>
					<a class="bg_links logo"></a>
				</div>

			</footer>
		<?php wp_footer(); ?>
	</body>
</html>
