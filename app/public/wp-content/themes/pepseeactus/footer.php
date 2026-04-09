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
			<div class="nveMenu text-left">
				<ul class="navlinks">
					<li class="<?php if (is_front_page()) echo 'current-menu-item'; ?>"><a href="<?= site_url(); ?>">ACCUEIL</a></li>
					<li class="<?php if (is_category('actus')) echo 'current-menu-item'; ?>"><a href="<?= site_url('/actus'); ?>">ACTUS</a></li>
					<li class="<?php if (get_post_type() == 'music') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('music'); ?>">SINGLES</a></li>
					<li class="<?php if (get_post_type() == 'riddim') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('riddim'); ?>">RIDDIMS</a></li>
					<li class="<?php if (get_post_type() == 'album') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('album'); ?>">ALBUMS</a></li>
					<li class="<?php if (get_post_type() == 'artist') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('artist'); ?>">ARTISTES</a></li>
					<li class="<?php if (get_post_type() == 'beatmaker') echo 'current-menu-item'; ?>"><a href="<?= get_post_type_archive_link('beatmaker'); ?>">BEATMAKERS</a></li>
					<li class="<?php if (is_page('a-propos')) echo 'current-menu-item'; ?>"><a href="<?= site_url('/a-propos'); ?>">À PROPOS</a></li>
				</ul>
				<div class="playlist-menu">
					<p>Rejoignez les playlists officielles PepseeActus</p>
					<a href="https://open.spotify.com/playlist/0xM4JRSfCYl993rHyPDYVW" target="_blank">
						<img src="<?= get_stylesheet_directory_uri(); ?>/assets/img/playlist dancehall lokal 2023.jpg" alt="playlist dancehall lokal 2023">
					</a>
				</div>
				<div class="site-sidebar__meta">
					<ul class="social-icons">
						<li><a target="_blank" href="https://twitter.com/PepseeActus" rel="nofollow noopener" class="social-icon social-icon--twitter" aria-label="Go to Twitter">
							<svg viewBox="0 0 18 15"><path d="M17.647 1.776c-.65.3-1.347.504-2.08.596.748-.47 1.322-1.21 1.593-2.095-.7.434-1.475.75-2.3.92C14.2.46 13.26 0 12.218 0c-2 0-3.62 1.695-3.62 3.787 0 .296.03.585.093.863C5.686 4.492 3.018 2.984 1.23.693c-.313.56-.492 1.21-.492 1.904 0 1.314.64 2.473 1.61 3.152-.592-.02-1.15-.19-1.64-.478v.048c0 1.835 1.25 3.366 2.905 3.714-.304.086-.624.133-.954.133-.237 0-.46-.025-.685-.07.46 1.505 1.798 2.6 3.382 2.63-1.24 1.016-2.8 1.622-4.497 1.622-.292 0-.58-.02-.863-.055 1.6 1.073 3.504 1.7 5.55 1.7 6.66 0 10.3-5.77 10.3-10.774 0-.163-.004-.327-.01-.49.707-.533 1.32-1.2 1.806-1.96" fill="currentColor"></path></svg>
						</a></li>
						<li><a target="_blank" href="https://www.facebook.com/PepseeActus" rel="nofollow noopener" class="social-icon social-icon--facebook" aria-label="Go to Facebook">
							<svg viewBox="0 0 430 430"><path d="M158.385,83.299 L158.385,142.517 L115,142.517 L115,214.929 L158.385,214.929 L158.385,430.112 L247.507,430.112 L247.507,214.935 L307.312,214.935 C307.312,214.935 312.913,180.214 315.628,142.25 L247.844,142.25 L247.844,92.739 C247.844,85.339 257.561,75.385 267.165,75.385 L315.722,75.385 L315.722,0 L249.701,0 C156.182,-0.005 158.385,72.479 158.385,83.299 L158.385,83.299 L158.385,83.299 Z" fill="currentColor"></path></svg>
						</a></li>
						<li><a target="_blank" href="https://www.instagram.com/pepseeactus/" rel="nofollow noopener" class="social-icon social-icon--instagram" aria-label="Go to Instagram">
							<svg viewBox="0 0 456.346 456.804"><path d="M227.993,456.804c-30.812-0.545-61.632-0.829-92.435-1.713 c-26.597-0.764-52.373-5.566-75.451-19.737c-30.245-18.572-48.713-45.867-54.603-80.534c-3.522-20.732-4.769-42.024-5.09-63.095 c-0.688-45.142-0.416-90.307,0.071-135.456c0.259-23.952,1.053-47.995,9.037-71.024C24.826,41.1,55.899,14.306,101.291,5.583 c20.608-3.96,42.006-4.841,63.077-5.162c45.308-0.692,90.64-0.428,135.954,0.066c23.785,0.26,47.662,1.061,70.536,8.959 c44.35,15.312,71.278,46.445,79.942,92.088c3.914,20.622,4.811,42.012,5.131,63.082c0.688,45.143,0.416,90.307-0.07,135.456 c-0.258,23.952-1.051,47.995-9.032,71.024c-15.302,44.148-46.374,70.95-91.77,79.675c-20.608,3.961-41.999,4.383-63.081,5.209 c-21.295,0.835-42.648,0.185-63.977,0.185C227.998,456.377,227.995,456.59,227.993,456.804z M415.952,224.488 c-0.309-0.006-0.617-0.013-0.926-0.02c0-17.998,0.369-36.006-0.105-53.991c-0.456-17.298-1.118-34.641-2.865-51.845 c-3.918-38.566-26.875-65.159-64.881-72.353c-20.287-3.839-41.359-4.369-62.106-4.756c-37.982-0.708-75.994-0.618-113.98-0.029 c-19.603,0.305-39.396,0.995-58.717,3.994c-32.992,5.122-55.522,24.041-64.636,56.76c-2.919,10.481-4.625,21.599-4.883,32.473 c-0.979,41.3-1.589,82.621-1.443,123.931c0.093,26.287,0.696,52.662,2.977,78.831c3.375,38.719,26.532,65.223,64.542,72.519 c20.432,3.922,41.683,4.421,62.595,4.818c37.815,0.719,75.658,0.494,113.482,0.076c17.626-0.195,35.297-1.159,52.838-2.889 c16.256-1.602,31.469-6.919,44.537-17.308c21.19-16.846,29.37-40.069,30.618-65.825 C414.684,294.113,415.03,259.287,415.952,224.488z" fill="currentColor"></path><path d="M227.815,345.333c-65.06-0.023-116.819-52.325-116.792-118.018 c0.027-64.728,52.644-116.36,118.506-116.288c64.286,0.07,115.864,52.854,115.793,118.503 C345.253,293.451,292.583,345.356,227.815,345.333z M228.272,304.19c41.721-0.087,75.985-34.445,75.907-76.115 c-0.077-41.714-34.488-76.033-76.107-75.905c-41.773,0.129-75.981,34.427-75.906,76.106 C152.241,269.975,186.629,304.276,228.272,304.19z" fill="currentColor"></path><path d="M350.438,79.035c15.391,0.132,27.06,12.271,26.877,27.96 c-0.173,14.948-12.756,27.256-27.598,26.992c-15.232-0.271-27.646-12.948-27.354-27.938 C322.662,90.768,334.993,78.902,350.438,79.035z" fill="currentColor"></path></svg>
						</a></li>
						<li><a target="_blank" href="https://www.snapchat.com/add/pepseeactus" rel="nofollow noopener" class="social-icon social-icon--snapchat" aria-label="Go to Snapchat">
							<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path d="M521.142857 73.142857q76.571429-0.571429 137.428572 39.142857T752 222.285714q15.428571 33.142857 15.428571 102.285715 0 26.857143-5.142857 109.142857 8 4 16 4 10.285714 0 29.142857-7.714286t29.142858-7.714286q16.571429 0 32 10.285715t15.428571 26.285714q0 18.285714-18 30.857143t-39.428571 18-39.428572 16.571428T769.142857 551.428571q0 8.571429 6.857143 24.571429 21.142857 46.857143 58.571429 85.714286t82.571428 57.714285q16 6.857143 45.714286 13.142858 16 3.428571 16 20 0 40-125.142857 58.857142-4 6.285714-6.285715 22.285715t-8 26.571428-18.857142 10.571429q-11.428571 0-35.428572-3.714286t-36.571428-3.714286q-21.142857 0-35.428572 2.857143-18.285714 2.857143-36 12.857143t-33.142857 21.714286-33.142857 23.142857-43.428572 19.142857-56.571428 7.714286q-29.714286 0-55.142857-7.714286t-42.857143-19.142857-32.857143-23.142857-33.142857-21.714286-35.428572-12.857143q-14.857143-2.857143-36-2.857143-13.714286 0-37.428571 4.285715T204.571429 872q-14.285714 0-20-10.571429t-8-27.142857-6.285715-22.857143q-125.142857-18.857143-125.142857-58.857142 0-16.571429 16-20 29.714286-6.285714 45.714286-13.142858 44.571429-18.285714 82.571428-57.714285T248 576q6.857143-16 6.857143-24.571429 0-16-18-27.142857T197.142857 507.428571t-39.714286-18T139.428571 459.428571q0-15.428571 14.857143-26t31.428572-10.571428q8.571429 0 27.428571 7.428571t30.285714 7.428572q10.285714 0 18.285715-4-5.142857-81.142857-5.142857-108.571429 0-69.714286 15.428571-102.857143 36.571429-78.285714 98.285714-113.142857t150.857143-36z" fill="currentColor"></path></svg>
						</a></li>
							<li><a target="_blank" href="https://www.tiktok.com/@pepseeactus" rel="nofollow noopener" class="social-icon social-icon--tiktok" aria-label="Go to TitTok"><svg viewBox="-58.35 -186.71 2548.29 2538.85"><g fill="#25f4ee"><path d="M779.38 890.55v-88.12a650.81 650.81 0 0 0-92.45-7.94c-299.8-.64-565.22 193.64-655.25 479.6S47.92 1871.34 294 2042.56a684.7 684.7 0 0 1 485.36-1152z" fill="currentColor"></path><path d="M796 1888.72c167.62-.23 305.4-132.28 312.74-299.74V94.62h273A512.17 512.17 0 0 1 1373.8 0h-373.41v1492.92c-6.21 168.31-144.32 301.63-312.74 301.9a317.76 317.76 0 0 1-144.45-36.11A313.48 313.48 0 0 0 796 1888.72zM1891.66 601.64v-83.06a509.85 509.85 0 0 1-282.4-85.22 517.79 517.79 0 0 0 282.4 168.28z" fill="currentColor"></path></g><path d="M1609.26 433.36a514.19 514.19 0 0 1-127.84-339.47h-99.68a517.16 517.16 0 0 0 227.52 339.47zM686.93 1167.9a313.46 313.46 0 0 0-144.46 590.81A312.75 312.75 0 0 1 796 1262.51a329.69 329.69 0 0 1 92.44 14.49V897.05a654.77 654.77 0 0 0-92.44-7.22h-16.62v288.9a321.13 321.13 0 0 0-92.45-10.83z" fill="currentColor"></path><path d="M1891.66 601.64v288.91a886.23 886.23 0 0 1-517.86-168.29v759.1c-.8 378.78-308.09 685.43-686.87 685.43A679.65 679.65 0 0 1 294 2042.56 685.43 685.43 0 0 0 1481.42 1576V819.05A887.71 887.71 0 0 0 2000 985.17v-372a529.59 529.59 0 0 1-108.34-11.53z" fill="currentColor"></path><path d="M1373.8 1481.36v-759.1a886.11 886.11 0 0 0 518.58 166.12v-288.9a517.87 517.87 0 0 1-283.12-166.12 517.16 517.16 0 0 1-227.52-339.47h-273V1589a313.46 313.46 0 0 1-567 171.17 313.46 313.46 0 0 1 144.46-590.83 321.35 321.35 0 0 1 92.45 14.45V894.88A684.71 684.71 0 0 0 293.29 2050.5a679.65 679.65 0 0 0 393.64 116.29c378.78 0 686.07-306.65 686.87-685.43z" fill="currentColor"></path></svg>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="overlay"></div>
			<footer class="site-footer mobile-visually-hidden">
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
							<li><a href="<?= site_url('/publicite'); ?>"><span>Publicité et partenariat</span></a></li>
							<li><a href="<?= site_url('/mentions-legales'); ?>"><span>Mentions légales</span></a></li>
						</ul>
					</div>
				</div>
				<div class="site-info">PepseeActus Copyright 2010-<?= date("Y"); ?></div>

				<!-- back to top -->
				<a id="button"></a>
			</footer>
		<?php wp_footer(); ?>
	</body>
</html>
