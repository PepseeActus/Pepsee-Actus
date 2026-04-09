<?php
$args = wp_parse_args(
	$args ?? array(),
	array(
		'spotify'    => '',
		'title'      => '',
		'artist'     => '',
		'eyebrow'    => 'Spotify officiel',
		'cover_id'   => 0,
		'cover_url'  => '',
		'description'=> '',
		'meta_items' => array(),
		'tags'       => array(),
	)
);

$embed = function_exists( 'pepsee_get_spotify_embed_data' ) ? pepsee_get_spotify_embed_data( $args['spotify'] ) : null;

if ( empty( $embed['embed_url'] ) ) {
	return;
}

$cover_url = $args['cover_url'];
if ( ! $cover_url && ! empty( $args['cover_id'] ) ) {
	$cover_url = wp_get_attachment_image_url( (int) $args['cover_id'], 'large' );
}

$meta_items = array_values( array_filter( array_map( 'trim', (array) $args['meta_items'] ) ) );
$tags       = array_values( array_filter( array_map( 'trim', (array) $args['tags'] ) ) );
$embed_type = $embed['type'] ?? 'track';
$embed_height = in_array( $embed_type, array( 'album', 'playlist', 'show' ), true ) ? 352 : 152;
?>

<section class="spotify-shell">
	<div class="spotify-shell__intro">
		<p class="spotify-shell__eyebrow"><?= esc_html( $args['eyebrow'] ); ?></p>
		<h2>Écouter sur Spotify</h2>
		<?php if ( ! empty( $args['description'] ) ) : ?>
			<p class="spotify-shell__description"><?= esc_html( $args['description'] ); ?></p>
		<?php endif; ?>
	</div>

	<div class="spotify-shell__card">
		<div class="spotify-shell__summary">
			<?php if ( $cover_url ) : ?>
				<div class="spotify-shell__cover">
					<img src="<?= esc_url( $cover_url ); ?>" alt="<?= esc_attr( $args['title'] ?: get_the_title() ); ?>">
				</div>
			<?php endif; ?>

			<div class="spotify-shell__content">
				<p class="spotify-shell__label">Embed officiel Spotify</p>
				<h3><?= esc_html( $args['title'] ?: get_the_title() ); ?></h3>
				<?php if ( ! empty( $args['artist'] ) ) : ?>
					<p class="spotify-shell__artist"><?= esc_html( $args['artist'] ); ?></p>
				<?php endif; ?>

				<?php if ( $meta_items ) : ?>
					<ul class="spotify-shell__meta" aria-label="Informations complémentaires">
						<?php foreach ( $meta_items as $meta_item ) : ?>
							<li><?= esc_html( $meta_item ); ?></li>
						<?php endforeach; ?>
					</ul>
				<?php endif; ?>

				<?php if ( $tags ) : ?>
					<ul class="spotify-shell__tags" aria-label="Tags associés">
						<?php foreach ( $tags as $tag ) : ?>
							<li><?= esc_html( $tag ); ?></li>
						<?php endforeach; ?>
					</ul>
				<?php endif; ?>

				<a class="spotify-shell__cta" href="<?= esc_url( $embed['canonical_url'] ); ?>" target="_blank" rel="noopener noreferrer">
					Ouvrir dans Spotify
				</a>
			</div>
		</div>

		<div class="spotify-shell__embed">
			<iframe
				style="border-radius:12px"
				src="<?= esc_url( $embed['embed_url'] ); ?>"
				width="100%"
				height="<?= esc_attr( $embed_height ); ?>"
				frameborder="0"
				allowfullscreen=""
				allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
				loading="lazy"></iframe>
		</div>
	</div>
</section>
