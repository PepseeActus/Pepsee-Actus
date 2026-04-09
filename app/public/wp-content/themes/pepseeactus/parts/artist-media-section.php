<?php
$args = wp_parse_args(
	$args ?? array(),
	array(
		'title'          => '',
		'description'    => '',
		'cards'          => array(),
		'modifier'       => '',
		'reveal_initial' => 8,
	)
);

if ( empty( $args['cards'] ) ) {
	return;
}

$section_classes = trim( 'artist-detail__section artist-detail__section--media ' . $args['modifier'] );
$grid_id         = 'artist-grid-' . wp_unique_id();
?>

<section class="<?= esc_attr( $section_classes ); ?>">
	<div class="artist-detail__section-heading">
		<h2><?= esc_html( $args['title'] ); ?></h2>
		<?php if ( ! empty( $args['description'] ) ) : ?>
			<p><?= esc_html( $args['description'] ); ?></p>
		<?php endif; ?>
	</div>

	<div class="artist-detail__media-grid" id="<?= esc_attr( $grid_id ); ?>">
		<?php foreach ( $args['cards'] as $index => $card ) : ?>
			<?php
			$is_hidden    = $index >= (int) $args['reveal_initial'];
			$thumb_class  = 'artist-detail__media-thumb';
			$thumb_class .= ! empty( $card['thumb_shape'] ) ? ' artist-detail__media-thumb--' . $card['thumb_shape'] : '';
			?>
			<article class="artist-detail__media-card<?= $is_hidden ? ' is-hidden' : ''; ?>"<?= $is_hidden ? ' hidden' : ''; ?>>
				<a href="<?= esc_url( $card['url'] ); ?>" class="<?= esc_attr( $thumb_class ); ?>">
					<?php if ( ! empty( $card['image'] ) ) : ?>
						<img src="<?= esc_url( $card['image'] ); ?>" alt="<?= esc_attr( $card['image_alt'] ?? $card['title'] ); ?>">
					<?php endif; ?>
				</a>

				<div class="artist-detail__media-copy">
					<?php if ( ! empty( $card['eyebrow'] ) ) : ?>
						<p class="artist-detail__media-eyebrow"><?= esc_html( $card['eyebrow'] ); ?></p>
					<?php endif; ?>

					<a href="<?= esc_url( $card['url'] ); ?>" class="artist-detail__media-title">
						<?= esc_html( $card['title'] ); ?>
					</a>

					<?php if ( ! empty( $card['subtitle'] ) ) : ?>
						<p class="artist-detail__media-subtitle"><?= esc_html( $card['subtitle'] ); ?></p>
					<?php endif; ?>

					<?php if ( ! empty( $card['date'] ) ) : ?>
						<p class="artist-detail__media-date"><?= esc_html( $card['date'] ); ?></p>
					<?php endif; ?>
				</div>
			</article>
		<?php endforeach; ?>
	</div>

	<?php if ( count( $args['cards'] ) > (int) $args['reveal_initial'] ) : ?>
		<div class="artist-detail__section-action">
			<button
				type="button"
				class="artist-detail__reveal-button"
				data-reveal-trigger
				data-reveal-target="#<?= esc_attr( $grid_id ); ?>"
				data-reveal-label-more="<?= esc_attr__( 'Voir plus', 'pepseeactus' ); ?>"
				data-reveal-label-less="<?= esc_attr__( 'Voir moins', 'pepseeactus' ); ?>"
			>
				<?= esc_html__( 'Voir plus', 'pepseeactus' ); ?>
			</button>
		</div>
	<?php endif; ?>
</section>
