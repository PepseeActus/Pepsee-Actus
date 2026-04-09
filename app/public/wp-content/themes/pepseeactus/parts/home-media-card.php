<?php
$card  = $args['card'] ?? array();
$class = trim( (string) ( $args['class'] ?? '' ) );
$badge = trim( (string) ( $args['badge'] ?? '' ) );

if ( empty( $card['url'] ) || empty( $card['title'] ) ) {
	return;
}

$thumb_shape = ! empty( $card['thumb_shape'] ) ? 'home-media-card--' . sanitize_html_class( $card['thumb_shape'] ) : '';
$classes     = trim( 'home-media-card ' . $thumb_shape . ' ' . $class );
?>

<article class="<?= esc_attr( $classes ); ?>">
	<a class="home-media-card__thumb" href="<?= esc_url( $card['url'] ); ?>">
		<?php if ( ! empty( $card['image'] ) ) : ?>
			<img
				src="<?= esc_url( $card['image'] ); ?>"
				alt="<?= esc_attr( $card['image_alt'] ?? $card['title'] ); ?>"
				loading="lazy"
			/>
		<?php else : ?>
			<span class="home-media-card__thumb-placeholder"><?= esc_html( mb_substr( $card['title'], 0, 1 ) ); ?></span>
		<?php endif; ?>
	</a>
	<div class="home-media-card__copy">
		<?php if ( ! empty( $card['eyebrow'] ) || $badge ) : ?>
			<div class="home-media-card__eyebrow-row">
				<?php if ( ! empty( $card['eyebrow'] ) ) : ?>
					<p class="home-media-card__eyebrow"><?= esc_html( $card['eyebrow'] ); ?></p>
				<?php endif; ?>
				<?php if ( $badge ) : ?>
					<span class="home-media-card__badge"><?= esc_html( $badge ); ?></span>
				<?php endif; ?>
			</div>
		<?php endif; ?>
		<a class="home-media-card__title" href="<?= esc_url( $card['url'] ); ?>"><?= esc_html( $card['title'] ); ?></a>
		<?php if ( ! empty( $card['subtitle'] ) ) : ?>
			<p class="home-media-card__subtitle"><?= esc_html( $card['subtitle'] ); ?></p>
		<?php endif; ?>
		<?php if ( ! empty( $card['date'] ) ) : ?>
			<p class="home-media-card__meta"><?= esc_html( $card['date'] ); ?></p>
		<?php endif; ?>
	</div>
</article>
