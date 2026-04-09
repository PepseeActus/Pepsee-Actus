<?php
$story_post = get_post( $args['post'] ?? null );
$class      = trim( (string) ( $args['class'] ?? '' ) );

if ( ! $story_post instanceof WP_Post ) {
	return;
}

$categories = get_the_category( $story_post->ID );
$category   = $categories[0] ?? null;
$classes    = trim( 'home-story-card ' . $class );
?>

<article class="<?= esc_attr( $classes ); ?>">
	<a class="home-story-card__media" href="<?= esc_url( get_permalink( $story_post ) ); ?>">
		<?php if ( has_post_thumbnail( $story_post ) ) : ?>
			<?= get_the_post_thumbnail( $story_post, 'medium_large', array( 'loading' => 'lazy' ) ); ?>
		<?php else : ?>
			<span class="home-story-card__placeholder"><?= esc_html( mb_substr( get_the_title( $story_post ), 0, 1 ) ); ?></span>
		<?php endif; ?>
	</a>
	<div class="home-story-card__copy">
		<div class="home-story-card__meta">
			<?php if ( $category ) : ?>
				<span class="home-story-card__category"><?= esc_html( $category->name ); ?></span>
			<?php endif; ?>
			<span class="home-story-card__date"><?= esc_html( get_the_date( 'd M Y', $story_post ) ); ?></span>
		</div>
		<a class="home-story-card__title" href="<?= esc_url( get_permalink( $story_post ) ); ?>">
			<?= esc_html( wp_trim_words( get_the_title( $story_post ), 14, '...' ) ); ?>
		</a>
	</div>
</article>
