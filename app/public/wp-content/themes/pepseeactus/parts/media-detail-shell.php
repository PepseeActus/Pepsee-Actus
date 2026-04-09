<?php
$args = wp_parse_args(
	$args ?? array(),
	array(
		'type_label'         => '',
		'type_slug'          => '',
		'title'              => get_the_title(),
		'subtitle'           => '',
		'cover_id'           => get_post_thumbnail_id(),
		'cover_class'        => '',
		'meta_items'         => array(),
		'tags'               => array(),
		'associated_heading' => 'The network',
		'associated_cards'   => array(),
		'spotify_args'       => array(),
		'credits_heading'    => 'Credits',
		'credit_items'       => array(),
		'narrative_heading'  => 'The narrative',
		'content_html'       => '',
		'discovery_heading'  => 'Continue exploring',
		'discovery_cards'    => array(),
	)
);

$cover_image = '';
if ( ! empty( $args['cover_id'] ) ) {
	$cover_image = wp_get_attachment_image(
		(int) $args['cover_id'],
		'large',
		false,
		array(
			'class' => trim( 'media-detail__cover-image ' . $args['cover_class'] ),
			'alt'   => esc_attr( $args['title'] ),
		)
	);
}
?>

<article class="media-detail media-detail--<?= esc_attr( $args['type_slug'] ); ?>">
	<header class="media-detail__hero">
		<?php if ( $cover_image ) : ?>
			<div class="media-detail__cover">
				<?= $cover_image; ?>
			</div>
		<?php endif; ?>

		<div class="media-detail__hero-copy">
			<?php if ( ! empty( $args['type_label'] ) ) : ?>
				<p class="media-detail__eyebrow"><?= esc_html( $args['type_label'] ); ?></p>
			<?php endif; ?>

			<h1 class="media-detail__title"><?= esc_html( $args['title'] ); ?></h1>

			<?php if ( ! empty( $args['subtitle'] ) ) : ?>
				<p class="media-detail__subtitle"><?= esc_html( $args['subtitle'] ); ?></p>
			<?php endif; ?>

			<?php if ( ! empty( $args['meta_items'] ) ) : ?>
				<ul class="media-detail__meta">
					<?php foreach ( $args['meta_items'] as $meta_item ) : ?>
						<li><?= esc_html( $meta_item ); ?></li>
					<?php endforeach; ?>
				</ul>
			<?php endif; ?>

			<?php if ( ! empty( $args['tags'] ) ) : ?>
				<ul class="media-detail__tags">
					<?php foreach ( $args['tags'] as $tag ) : ?>
						<li><?= esc_html( $tag ); ?></li>
					<?php endforeach; ?>
				</ul>
			<?php endif; ?>

			<div class="media-detail__links">
				<?php get_template_part( 'parts/stream-link-template' ); ?>
			</div>
		</div>
	</header>

	<?php if ( ! empty( $args['associated_cards'] ) ) : ?>
		<section class="media-detail__section media-detail__section--network">
			<div class="media-detail__section-heading">
				<h2><?= esc_html( $args['associated_heading'] ); ?></h2>
				<p>Les profils liés pour poursuivre l'exploration sans cul-de-sac.</p>
			</div>

			<div class="media-detail__people-grid">
				<?php foreach ( $args['associated_cards'] as $card ) : ?>
					<article class="media-detail__person-card">
						<a href="<?= esc_url( $card['url'] ); ?>" class="media-detail__person-thumb">
							<?php if ( ! empty( $card['image'] ) ) : ?>
								<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['title'] ); ?>">
							<?php endif; ?>
						</a>
						<div class="media-detail__person-copy">
							<p class="media-detail__person-type"><?= esc_html( ucfirst( (string) $card['type'] ) ); ?></p>
							<a href="<?= esc_url( $card['url'] ); ?>" class="media-detail__person-name">
								<?= esc_html( $card['title'] ); ?>
							</a>
							<?php if ( ! empty( $card['verified'] ) ) : ?>
								<span class="media-detail__verified">Verified</span>
							<?php endif; ?>
						</div>
					</article>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>

	<div class="social-sharing media-detail__sharing">
		<?php get_template_part( 'parts/sharing-buttons' ); ?>
	</div>

	<?php if ( ! empty( $args['spotify_args'] ) ) : ?>
		<?php get_template_part( 'parts/spotify-embed-shell', null, $args['spotify_args'] ); ?>
	<?php endif; ?>

	<?php if ( ! empty( $args['credit_items'] ) ) : ?>
		<section class="media-detail__section media-detail__section--credits">
			<div class="media-detail__section-heading">
				<h2><?= esc_html( $args['credits_heading'] ); ?></h2>
				<p>Une lecture rapide des métadonnées éditoriales et musicales.</p>
			</div>
			<div class="media-detail__credit-grid">
				<?php foreach ( $args['credit_items'] as $credit_item ) : ?>
					<div class="media-detail__credit-card">
						<p class="media-detail__credit-label"><?= esc_html( $credit_item['label'] ); ?></p>
						<div class="media-detail__credit-value"><?= wp_kses_post( $credit_item['value'] ); ?></div>
					</div>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>

	<?php if ( ! empty( $args['content_html'] ) ) : ?>
		<section class="media-detail__section media-detail__section--narrative">
			<div class="media-detail__section-heading">
				<h2><?= esc_html( $args['narrative_heading'] ); ?></h2>
				<p>Le contexte éditorial, l'histoire du morceau et les liens avec l'écosystème PepseeActus.</p>
			</div>
			<div class="media-detail__narrative-content">
				<?= $args['content_html']; ?>
			</div>
		</section>
	<?php endif; ?>

	<?php if ( ! empty( $args['discovery_cards'] ) ) : ?>
		<section class="media-detail__section media-detail__section--discovery">
			<div class="media-detail__section-heading">
				<h2><?= esc_html( $args['discovery_heading'] ); ?></h2>
				<p>Une boucle de découverte continue pensée pour mobile-first.</p>
			</div>
			<div class="media-detail__discovery-grid">
				<?php foreach ( $args['discovery_cards'] as $card ) : ?>
					<article class="media-detail__discovery-card">
						<a href="<?= esc_url( $card['url'] ); ?>" class="media-detail__discovery-thumb">
							<?php if ( ! empty( $card['image'] ) ) : ?>
								<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['title'] ); ?>">
							<?php endif; ?>
						</a>
						<div class="media-detail__discovery-copy">
							<p class="media-detail__discovery-eyebrow"><?= esc_html( $card['eyebrow'] ); ?></p>
							<a href="<?= esc_url( $card['url'] ); ?>" class="media-detail__discovery-title"><?= esc_html( $card['title'] ); ?></a>
							<?php if ( ! empty( $card['subtitle'] ) ) : ?>
								<p class="media-detail__discovery-subtitle"><?= esc_html( $card['subtitle'] ); ?></p>
							<?php endif; ?>
						</div>
					</article>
				<?php endforeach; ?>
			</div>
		</section>
	<?php endif; ?>
</article>
