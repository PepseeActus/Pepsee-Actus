<?php
$args = wp_parse_args(
	$args ?? array(),
	array(
		'title'            => get_the_title(),
		'verified'         => false,
		'status'           => '',
		'cover_id'         => get_post_thumbnail_id(),
		'genres'           => array(),
		'origins'          => array(),
		'stats'            => array(),
		'fact_rows'        => array(),
		'narrative_html'   => '',
		'network_groups'   => array(),
		'singles_cards'    => array(),
		'discography_cards'=> array(),
		'featured_cards'   => array(),
		'riddim_cards'     => array(),
		'news_posts'       => array(),
		'discovery_cards'  => array(),
	)
);

$cover_image = '';
if ( ! empty( $args['cover_id'] ) ) {
	$cover_image = wp_get_attachment_image(
		(int) $args['cover_id'],
		'large',
		false,
		array(
			'class' => 'artist-detail__hero-image',
			'alt'   => esc_attr( $args['title'] ),
		)
	);
}
?>

<article class="artist-detail">
	<header class="artist-detail__hero">
		<div class="artist-detail__hero-media">
			<?php if ( $cover_image ) : ?>
				<div class="artist-detail__hero-cover">
					<?= $cover_image; ?>
				</div>
			<?php endif; ?>

			<?php if ( ! empty( $args['stats'] ) ) : ?>
				<div class="artist-detail__stats">
					<?php foreach ( $args['stats'] as $stat ) : ?>
						<div class="artist-detail__stat-card">
							<p class="artist-detail__stat-value"><?= esc_html( $stat['value'] ); ?></p>
							<p class="artist-detail__stat-label"><?= esc_html( $stat['label'] ); ?></p>
						</div>
					<?php endforeach; ?>
				</div>
			<?php endif; ?>
		</div>

		<div class="artist-detail__hero-copy">
			<p class="artist-detail__eyebrow"><?= esc_html__( 'Artist profile', 'pepseeactus' ); ?></p>

			<div class="artist-detail__title-row">
				<h1 class="artist-detail__title"><?= esc_html( $args['title'] ); ?></h1>
				<?php if ( ! empty( $args['verified'] ) ) : ?>
					<span class="artist-detail__verified-badge" aria-label="<?= esc_attr__( 'Compte vérifié', 'pepseeactus' ); ?>">
						Verified
					</span>
				<?php endif; ?>
			</div>

			<?php if ( ! empty( $args['status'] ) ) : ?>
				<p class="artist-detail__status"><?= esc_html( $args['status'] ); ?></p>
			<?php endif; ?>

			<?php if ( ! empty( $args['origins'] ) || ! empty( $args['genres'] ) ) : ?>
				<ul class="artist-detail__chips">
					<?php foreach ( array_filter( (array) $args['origins'] ) as $origin ) : ?>
						<li><?= esc_html( $origin ); ?></li>
					<?php endforeach; ?>
					<?php foreach ( array_filter( (array) $args['genres'] ) as $genre ) : ?>
						<li><?= esc_html( $genre ); ?></li>
					<?php endforeach; ?>
				</ul>
			<?php endif; ?>

			<div class="artist-detail__socials">
				<?php get_template_part( 'parts/reseaux-template' ); ?>
			</div>
		</div>
	</header>

	<section class="artist-detail__section artist-detail__section--facts">
		<div class="artist-detail__section-heading">
			<h2><?= esc_html__( 'The profile', 'pepseeactus' ); ?></h2>
			<p><?= esc_html__( 'Une lecture rapide type Wikipedia, mais pensée comme une entrée premium dans l’univers PepseeActus.', 'pepseeactus' ); ?></p>
		</div>

		<div class="artist-detail__facts-grid">
			<?php foreach ( $args['fact_rows'] as $row ) : ?>
				<div class="artist-detail__fact-card">
					<p class="artist-detail__fact-label"><?= esc_html( $row['label'] ); ?></p>
					<div class="artist-detail__fact-value"><?= wp_kses_post( $row['value'] ); ?></div>
				</div>
			<?php endforeach; ?>
		</div>
	</section>

	<?php if ( ! empty( $args['narrative_html'] ) ) : ?>
		<section class="artist-detail__section artist-detail__section--narrative">
			<div class="artist-detail__section-heading">
				<h2><?= esc_html__( 'The narrative', 'pepseeactus' ); ?></h2>
				<p><?= esc_html__( 'Le contexte éditorial, l’histoire et les repères à garder pour continuer l’exploration.', 'pepseeactus' ); ?></p>
			</div>

			<div class="artist-detail__narrative readmore">
				<?= $args['narrative_html']; ?>
				<p class="readmore-link">
					<a href="#" data-readmore-toggle><?= esc_html__( 'Voir plus', 'pepseeactus' ); ?></a>
				</p>
			</div>
		</section>
	<?php endif; ?>

	<?php
	get_template_part(
		'parts/artist-media-section',
		null,
		array(
			'title'       => __( 'Popular now', 'pepseeactus' ),
			'description' => __( 'Les morceaux qui racontent le mieux la trajectoire de l’artiste et créent une vraie porte d’entrée mobile-first.', 'pepseeactus' ),
			'cards'       => $args['singles_cards'],
			'modifier'    => 'artist-detail__section--popular',
		)
	);

	get_template_part(
		'parts/artist-media-section',
		null,
		array(
			'title'       => __( 'Discography', 'pepseeactus' ),
			'description' => __( 'Les sorties majeures à remettre au centre du parcours de lecture et d’écoute.', 'pepseeactus' ),
			'cards'       => $args['discography_cards'],
			'modifier'    => 'artist-detail__section--discography',
			'reveal_initial' => 6,
		)
	);

	get_template_part(
		'parts/artist-media-section',
		null,
		array(
			'title'       => __( 'Featured on', 'pepseeactus' ),
			'description' => __( 'Les collaborations et apparitions qui ouvrent le maillage éditorial.', 'pepseeactus' ),
			'cards'       => $args['featured_cards'],
			'modifier'    => 'artist-detail__section--featured',
			'reveal_initial' => 6,
		)
	);

	get_template_part(
		'parts/artist-media-section',
		null,
		array(
			'title'       => __( 'Appears on riddims', 'pepseeactus' ),
			'description' => __( 'Les riddims liés pour prolonger l’expérience de découverte sans cul-de-sac.', 'pepseeactus' ),
			'cards'       => $args['riddim_cards'],
			'modifier'    => 'artist-detail__section--riddims',
			'reveal_initial' => 6,
		)
	);
	?>

	<?php if ( ! empty( $args['network_groups'] ) ) : ?>
		<section class="artist-detail__section artist-detail__section--network">
			<div class="artist-detail__section-heading">
				<h2><?= esc_html__( 'The network', 'pepseeactus' ); ?></h2>
				<p><?= esc_html__( 'Parents, fratrie, descendants et proches : le graphe relationnel devient un vrai moteur de navigation.', 'pepseeactus' ); ?></p>
			</div>

			<div class="artist-detail__network-groups">
				<?php foreach ( $args['network_groups'] as $group ) : ?>
					<section class="artist-detail__network-group">
						<div class="artist-detail__network-header">
							<h3><?= esc_html( $group['label'] ); ?></h3>
							<?php if ( ! empty( $group['description'] ) ) : ?>
								<p><?= esc_html( $group['description'] ); ?></p>
							<?php endif; ?>
						</div>

						<div class="artist-detail__network-grid">
							<?php foreach ( $group['cards'] as $card ) : ?>
								<article class="artist-detail__network-card">
									<a href="<?= esc_url( $card['url'] ); ?>" class="artist-detail__network-thumb">
										<?php if ( ! empty( $card['image'] ) ) : ?>
											<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['title'] ); ?>">
										<?php endif; ?>
									</a>
									<div class="artist-detail__network-copy">
										<p class="artist-detail__network-type"><?= esc_html( ucfirst( (string) $card['type'] ) ); ?></p>
										<a href="<?= esc_url( $card['url'] ); ?>" class="artist-detail__network-name"><?= esc_html( $card['title'] ); ?></a>
									</div>
								</article>
							<?php endforeach; ?>
						</div>
					</section>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>

	<?php if ( ! empty( $args['news_posts'] ) ) : ?>
		<section class="artist-detail__section artist-detail__section--news">
			<div class="artist-detail__section-heading">
				<h2><?= sprintf( esc_html__( "L'actu de %s", 'pepseeactus' ), esc_html( $args['title'] ) ); ?></h2>
				<p><?= esc_html__( 'Les dernières actus pour garder la boucle d’engagement active jusque sous le player ou la fiche artiste.', 'pepseeactus' ); ?></p>
			</div>

			<div class="artist-detail__news-grid">
				<?php foreach ( $args['news_posts'] as $post_object ) : ?>
					<?php $post_object = get_post( $post_object ); ?>
					<?php if ( ! $post_object instanceof WP_Post ) { continue; } ?>
					<article class="artist-detail__news-card">
						<a href="<?= esc_url( get_permalink( $post_object ) ); ?>" class="artist-detail__news-thumb">
							<?php if ( has_post_thumbnail( $post_object ) ) : ?>
								<?= get_the_post_thumbnail( $post_object, 'medium_large' ); ?>
							<?php endif; ?>
						</a>
						<div class="artist-detail__news-copy">
							<p class="artist-detail__news-date"><?= esc_html( get_the_date( 'j F Y', $post_object ) ); ?></p>
							<a href="<?= esc_url( get_permalink( $post_object ) ); ?>" class="artist-detail__news-title">
								<?= esc_html( wp_trim_words( get_the_title( $post_object ), 11, '...' ) ); ?>
							</a>
						</div>
					</article>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>

	<?php if ( ! empty( $args['discovery_cards'] ) ) : ?>
		<section class="artist-detail__section artist-detail__section--discovery">
			<div class="artist-detail__section-heading">
				<h2><?= esc_html__( 'Continue exploring', 'pepseeactus' ); ?></h2>
				<p><?= esc_html__( 'Une sélection complémentaire pour relancer la découverte à partir de cette fiche artiste.', 'pepseeactus' ); ?></p>
			</div>

			<div class="artist-detail__discovery-grid">
				<?php foreach ( $args['discovery_cards'] as $card ) : ?>
					<article class="artist-detail__discovery-card">
						<a href="<?= esc_url( $card['url'] ); ?>" class="artist-detail__discovery-thumb">
							<?php if ( ! empty( $card['image'] ) ) : ?>
								<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['title'] ); ?>">
							<?php endif; ?>
						</a>
						<div class="artist-detail__discovery-copy">
							<p class="artist-detail__discovery-eyebrow"><?= esc_html( $card['eyebrow'] ); ?></p>
							<a href="<?= esc_url( $card['url'] ); ?>" class="artist-detail__discovery-title"><?= esc_html( $card['title'] ); ?></a>
							<?php if ( ! empty( $card['subtitle'] ) ) : ?>
								<p class="artist-detail__discovery-subtitle"><?= esc_html( $card['subtitle'] ); ?></p>
							<?php endif; ?>
						</div>
					</article>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>

	<div class="artist-detail__sharing social-sharing">
		<?php get_template_part( 'parts/sharing-buttons' ); ?>
	</div>
</article>
