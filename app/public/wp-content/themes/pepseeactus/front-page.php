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

get_header();
get_template_part( 'parts/front-hero' );

$latest_music_posts = get_posts(
	array(
		'post_type'           => 'music',
		'post_status'         => 'publish',
		'posts_per_page'      => 7,
		'ignore_sticky_posts' => true,
		'date_query'          => array(
			array(
				'after'     => array( 'year' => 2015 ),
				'inclusive' => true,
			),
		),
	)
);

$featured_music_post = null;

if ( ! empty( $latest_music_posts ) ) {
	$featured_music_post = array_shift( $latest_music_posts );
}

$news_posts = get_posts(
	array(
		'post_type'           => 'post',
		'post_status'         => 'publish',
		'posts_per_page'      => 6,
		'category__in'        => array( 5, 126 ),
		'ignore_sticky_posts' => true,
	)
);

$featured_story_post = null;

if ( ! empty( $news_posts ) ) {
	$featured_story_post = array_shift( $news_posts );
}

$album_posts   = get_posts( array( 'post_type' => 'album', 'post_status' => 'publish', 'posts_per_page' => 6, 'ignore_sticky_posts' => true ) );
$riddim_posts  = get_posts( array( 'post_type' => 'riddim', 'post_status' => 'publish', 'posts_per_page' => 6, 'ignore_sticky_posts' => true ) );
$artist_posts  = get_posts( array( 'post_type' => 'artist', 'post_status' => 'publish', 'posts_per_page' => 7, 'ignore_sticky_posts' => true ) );
$featured_artist = null;

if ( ! empty( $artist_posts ) ) {
	$featured_artist = array_shift( $artist_posts );
}

$trending_music_cards = pepsee_prepare_media_cards( $latest_music_posts );
$album_cards          = pepsee_prepare_media_cards( $album_posts );
$riddim_cards         = pepsee_prepare_media_cards( $riddim_posts );
$artist_cards         = pepsee_prepare_people_cards( $artist_posts );
$discovery_cards      = pepsee_prepare_discovery_cards(
	array_slice(
		pepsee_sort_posts_by_date_desc(
			array_merge( $latest_music_posts, $album_posts, $riddim_posts )
		),
		0,
		6
	)
);

$featured_music_title   = $featured_music_post ? trim( (string) get_field( 'titre', $featured_music_post->ID ) ) : '';
$featured_music_title   = $featured_music_title ?: ( $featured_music_post ? get_the_title( $featured_music_post ) : '' );
$featured_music_artists = $featured_music_post ? pepsee_format_artist_display( get_field( 'artistes', $featured_music_post->ID ) ) : '';
$featured_music_riddims = $featured_music_post ? pepsee_prepare_post_link_items( get_field( 'riddim', $featured_music_post->ID ) ) : array();
$featured_music_genres  = $featured_music_post ? pepsee_prepare_text_tags( get_the_terms( $featured_music_post->ID, 'genre' ) ?: array() ) : array();
$featured_artist_ids    = $featured_music_post ? pepsee_normalize_related_ids( get_field( 'artistes', $featured_music_post->ID ) ) : array();
$featured_artist_link   = ! empty( $featured_artist_ids ) ? get_permalink( $featured_artist_ids[0] ) : '';
$featured_story_category = $featured_story_post ? ( get_the_category( $featured_story_post->ID )[0] ?? null ) : null;
$music_archive          = get_post_type_archive_link( 'music' );
$artist_archive         = get_post_type_archive_link( 'artist' );
$album_archive          = get_post_type_archive_link( 'album' );
$riddim_archive         = get_post_type_archive_link( 'riddim' );
?>

<div class="home-feed">
	<?php if ( $featured_music_post ) : ?>
		<section class="home-feed__spotlight">
			<article class="home-feed__spotlight-primary">
				<div class="home-feed__spotlight-copy">
					<p class="home-feed__section-kicker">Pepsee selection</p>
					<h2><?= esc_html( $featured_music_title ); ?></h2>
					<?php if ( $featured_music_artists ) : ?>
						<p class="home-feed__spotlight-subtitle"><?= esc_html( $featured_music_artists ); ?></p>
					<?php endif; ?>
					<ul class="home-feed__spotlight-meta">
						<li>Single</li>
						<li><?= esc_html( get_the_date( 'd M Y', $featured_music_post ) ); ?></li>
						<?php if ( ! empty( $featured_music_genres ) ) : ?>
							<li><?= esc_html( $featured_music_genres[0] ); ?></li>
						<?php endif; ?>
					</ul>
					<?php if ( ! empty( $featured_music_riddims ) ) : ?>
						<p class="home-feed__spotlight-context">
							Sur le riddim <?= wp_kses_post( $featured_music_riddims[0] ); ?>
						</p>
					<?php endif; ?>
					<div class="home-feed__spotlight-actions">
						<a class="home-feed__button home-feed__button--primary" href="<?= esc_url( get_permalink( $featured_music_post ) ); ?>">Écouter maintenant</a>
						<?php if ( $featured_artist_link ) : ?>
							<a class="home-feed__button" href="<?= esc_url( $featured_artist_link ); ?>">Voir l'artiste</a>
						<?php endif; ?>
					</div>
				</div>
				<a class="home-feed__spotlight-cover" href="<?= esc_url( get_permalink( $featured_music_post ) ); ?>">
					<?php if ( has_post_thumbnail( $featured_music_post ) ) : ?>
						<?= get_the_post_thumbnail( $featured_music_post, 'large', array( 'class' => 'home-feed__spotlight-image' ) ); ?>
					<?php else : ?>
						<span class="home-feed__spotlight-placeholder"><?= esc_html( mb_substr( $featured_music_title, 0, 1 ) ); ?></span>
					<?php endif; ?>
				</a>
			</article>

			<div class="home-feed__spotlight-sidebar">
				<?php if ( $featured_story_post ) : ?>
					<article class="home-feed__side-card home-feed__side-card--story">
						<p class="home-feed__section-kicker">À lire</p>
						<a class="home-feed__side-card-media" href="<?= esc_url( get_permalink( $featured_story_post ) ); ?>">
							<?php if ( has_post_thumbnail( $featured_story_post ) ) : ?>
								<?= get_the_post_thumbnail( $featured_story_post, 'medium_large', array( 'loading' => 'lazy' ) ); ?>
							<?php endif; ?>
						</a>
						<?php if ( $featured_story_category ) : ?>
							<p class="home-feed__side-card-tag"><?= esc_html( $featured_story_category->name ); ?></p>
						<?php endif; ?>
						<a class="home-feed__side-card-title" href="<?= esc_url( get_permalink( $featured_story_post ) ); ?>">
							<?= esc_html( wp_trim_words( get_the_title( $featured_story_post ), 12, '...' ) ); ?>
						</a>
					</article>
				<?php endif; ?>

				<?php if ( $featured_artist instanceof WP_Post ) : ?>
					<article class="home-feed__side-card home-feed__side-card--artist">
						<p class="home-feed__section-kicker">Artist watch</p>
						<a class="home-feed__artist-highlight" href="<?= esc_url( get_permalink( $featured_artist ) ); ?>">
							<span class="home-feed__artist-highlight-media">
								<?php if ( has_post_thumbnail( $featured_artist ) ) : ?>
									<?= get_the_post_thumbnail( $featured_artist, 'medium', array( 'loading' => 'lazy' ) ); ?>
								<?php endif; ?>
							</span>
							<span class="home-feed__artist-highlight-copy">
								<span class="home-feed__artist-highlight-name"><?= esc_html( get_the_title( $featured_artist ) ); ?></span>
								<span class="home-feed__artist-highlight-meta">
									<?= get_field( 'compte_verifie', $featured_artist->ID ) ? 'Verified artist' : 'À explorer'; ?>
								</span>
							</span>
						</a>
					</article>
				<?php endif; ?>
			</div>
		</section>
	<?php endif; ?>

	<section class="home-feed__section">
		<div class="home-feed__section-heading">
			<div>
				<p class="home-feed__section-kicker">Trending songs</p>
				<h2>Les sons qui font tourner la semaine</h2>
			</div>
			<?php if ( $music_archive ) : ?>
				<a class="home-feed__section-link" href="<?= esc_url( $music_archive ); ?>">Voir toute la sélection</a>
			<?php endif; ?>
		</div>
		<div class="home-feed__carousel home-feed__carousel--media swiper">
			<div class="swiper-wrapper">
				<?php foreach ( $trending_music_cards as $index => $card ) : ?>
					<div class="swiper-slide">
						<?php
						get_template_part(
							'parts/home-media-card',
							null,
							array(
								'card'  => $card,
								'class' => 'home-media-card--rail',
								'badge' => 0 === $index ? 'New' : '',
							)
						);
						?>
					</div>
				<?php endforeach; ?>
			</div>
			<div class="home-feed__carousel-nav">
				<button class="home-feed__carousel-button home-feed__carousel-button--prev" type="button" aria-label="Précédent">
					<span aria-hidden="true">&larr;</span>
				</button>
				<button class="home-feed__carousel-button home-feed__carousel-button--next" type="button" aria-label="Suivant">
					<span aria-hidden="true">&rarr;</span>
				</button>
			</div>
		</div>
	</section>

	<?php if ( $featured_story_post || ! empty( $news_posts ) ) : ?>
		<section class="home-feed__section home-feed__section--stories">
			<div class="home-feed__section-heading">
				<div>
					<p class="home-feed__section-kicker">Magazine</p>
					<h2>Actus et décryptages à ne pas rater</h2>
				</div>
			</div>
			<div class="home-feed__stories-grid">
				<?php if ( $featured_story_post ) : ?>
					<?php get_template_part( 'parts/home-story-card', null, array( 'post' => $featured_story_post, 'class' => 'home-story-card--featured' ) ); ?>
				<?php endif; ?>
				<div class="home-feed__stories-stack">
					<?php foreach ( $news_posts as $news_post ) : ?>
						<?php get_template_part( 'parts/home-story-card', null, array( 'post' => $news_post ) ); ?>
					<?php endforeach; ?>
				</div>
			</div>
		</section>
	<?php endif; ?>

	<section class="home-feed__duo">
		<section class="home-feed__section">
			<div class="home-feed__section-heading">
				<div>
					<p class="home-feed__section-kicker">Albums & mixtapes</p>
					<h2>Des projets à écouter en entier</h2>
				</div>
				<?php if ( $album_archive ) : ?>
					<a class="home-feed__section-link" href="<?= esc_url( $album_archive ); ?>">Voir tous les albums</a>
				<?php endif; ?>
			</div>
			<div class="home-feed__stack">
				<?php foreach ( $album_cards as $index => $card ) : ?>
					<?php
					get_template_part(
						'parts/home-media-card',
						null,
						array(
							'card'  => $card,
							'class' => 'home-media-card--stack',
							'badge' => 0 === $index ? 'Fresh' : '',
						)
					);
					?>
				<?php endforeach; ?>
			</div>
		</section>

		<section class="home-feed__section">
			<div class="home-feed__section-heading">
				<div>
					<p class="home-feed__section-kicker">Riddims</p>
					<h2>Les bases instrumentales à remonter</h2>
				</div>
				<?php if ( $riddim_archive ) : ?>
					<a class="home-feed__section-link" href="<?= esc_url( $riddim_archive ); ?>">Voir tous les riddims</a>
				<?php endif; ?>
			</div>
			<div class="home-feed__stack">
				<?php foreach ( $riddim_cards as $index => $card ) : ?>
					<?php
					get_template_part(
						'parts/home-media-card',
						null,
						array(
							'card'  => $card,
							'class' => 'home-media-card--stack',
							'badge' => 0 === $index ? 'New' : '',
						)
					);
					?>
				<?php endforeach; ?>
			</div>
		</section>
	</section>

	<?php if ( $featured_artist || ! empty( $artist_cards ) ) : ?>
		<section class="home-feed__section home-feed__section--artists">
			<div class="home-feed__section-heading">
				<div>
					<p class="home-feed__section-kicker">Artist files</p>
					<h2>Des fiches artistes pensées pour l’exploration</h2>
				</div>
				<?php if ( $artist_archive ) : ?>
					<a class="home-feed__section-link" href="<?= esc_url( $artist_archive ); ?>">Voir tous les artistes</a>
				<?php endif; ?>
			</div>

			<?php if ( $featured_artist instanceof WP_Post ) : ?>
				<article class="home-feed__artist-spotlight">
					<a class="home-feed__artist-spotlight-media" href="<?= esc_url( get_permalink( $featured_artist ) ); ?>">
						<?php if ( has_post_thumbnail( $featured_artist ) ) : ?>
							<?= get_the_post_thumbnail( $featured_artist, 'large', array( 'loading' => 'lazy' ) ); ?>
						<?php endif; ?>
					</a>
					<div class="home-feed__artist-spotlight-copy">
						<p class="home-feed__section-kicker">Featured artist</p>
						<h3><?= esc_html( get_the_title( $featured_artist ) ); ?></h3>
						<p>
							Une entrée directe vers les singles, albums, riddims et actus liés à l’artiste, dans une logique de fiche vivante.
						</p>
						<a class="home-feed__button home-feed__button--primary" href="<?= esc_url( get_permalink( $featured_artist ) ); ?>">Ouvrir la fiche</a>
					</div>
				</article>
			<?php endif; ?>

			<div class="home-feed__carousel home-feed__carousel--artists swiper">
				<div class="swiper-wrapper">
					<?php foreach ( $artist_cards as $artist_card ) : ?>
						<div class="swiper-slide">
							<article class="home-feed__artist-card">
								<a class="home-feed__artist-card-media" href="<?= esc_url( $artist_card['url'] ); ?>">
									<?php if ( ! empty( $artist_card['image'] ) ) : ?>
										<img src="<?= esc_url( $artist_card['image'] ); ?>" alt="<?= esc_attr( $artist_card['title'] ); ?>" loading="lazy" />
									<?php endif; ?>
								</a>
								<div class="home-feed__artist-card-copy">
									<a class="home-feed__artist-card-name" href="<?= esc_url( $artist_card['url'] ); ?>"><?= esc_html( $artist_card['title'] ); ?></a>
									<p class="home-feed__artist-card-meta"><?= $artist_card['verified'] ? 'Verified artist' : 'Fiche artiste'; ?></p>
								</div>
							</article>
						</div>
					<?php endforeach; ?>
				</div>
				<div class="home-feed__carousel-nav">
					<button class="home-feed__carousel-button home-feed__carousel-button--prev" type="button" aria-label="Précédent">
						<span aria-hidden="true">&larr;</span>
					</button>
					<button class="home-feed__carousel-button home-feed__carousel-button--next" type="button" aria-label="Suivant">
						<span aria-hidden="true">&rarr;</span>
					</button>
				</div>
			</div>
		</section>
	<?php endif; ?>

	<?php if ( ! empty( $discovery_cards ) ) : ?>
		<section class="home-feed__section">
			<div class="home-feed__section-heading">
				<div>
					<p class="home-feed__section-kicker">Continue exploring</p>
					<h2>Pas de cul-de-sac, seulement des prochaines écoutes</h2>
				</div>
			</div>
			<div class="home-feed__discovery-grid">
				<?php foreach ( $discovery_cards as $card ) : ?>
					<article class="home-feed__discovery-card">
						<a class="home-feed__discovery-thumb" href="<?= esc_url( $card['url'] ); ?>">
							<?php if ( ! empty( $card['image'] ) ) : ?>
								<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['title'] ); ?>" loading="lazy" />
							<?php endif; ?>
						</a>
						<div class="home-feed__discovery-copy">
							<p class="home-feed__section-kicker"><?= esc_html( $card['eyebrow'] ); ?></p>
							<a class="home-feed__discovery-title" href="<?= esc_url( $card['url'] ); ?>"><?= esc_html( $card['title'] ); ?></a>
							<?php if ( ! empty( $card['subtitle'] ) ) : ?>
								<p class="home-feed__discovery-subtitle"><?= esc_html( $card['subtitle'] ); ?></p>
							<?php endif; ?>
						</div>
					</article>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>
</div>

<?php get_footer();
