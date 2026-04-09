<?php
$counts = function_exists( 'get_custom_post_counts' ) ? get_custom_post_counts() : array();

$music_total     = $counts['music']['total'] ?? 0;
$album_total     = $counts['album']['total'] ?? 0;
$riddim_total    = $counts['riddim']['total'] ?? 0;
$beatmaker_total = $counts['beatmaker']['total'] ?? 0;
$artist_total    = $counts['artist']['total'] ?? 0;

$music_recent     = $counts['music']['since_2025'] ?? 0;
$album_recent     = $counts['album']['since_2025'] ?? 0;
$riddim_recent    = $counts['riddim']['since_2025'] ?? 0;
$beatmaker_recent = $counts['beatmaker']['since_2025'] ?? 0;
$artist_recent    = $counts['artist']['since_2025'] ?? 0;

$music_archive  = get_post_type_archive_link( 'music' );
$artist_archive = get_post_type_archive_link( 'artist' );
$album_archive  = get_post_type_archive_link( 'album' );
$riddim_archive = get_post_type_archive_link( 'riddim' );
?>

<section class="front-hero">
	<div class="front-hero__content">
		<div class="front-hero__copy">
			<p class="front-hero__eyebrow">Media musical caribéen</p>
			<h1>Le meilleur de la French Caribbean Music.</h1>
			<p class="front-hero__lede">
				Une base éditoriale pensée mobile-first pour découvrir les nouveautés, explorer les artistes et prolonger l'écoute.
			</p>
			<p class="front-hero__genres">Dancehall · Shatta · Soca · Bouyon · Afro</p>
			<div class="front-hero__actions">
				<?php if ( $music_archive ) : ?>
					<a class="front-hero__button front-hero__button--primary" href="<?= esc_url( $music_archive ); ?>">Explorer les sons</a>
				<?php endif; ?>
				<?php if ( $artist_archive ) : ?>
					<a class="front-hero__button" href="<?= esc_url( $artist_archive ); ?>">Voir les artistes</a>
				<?php endif; ?>
			</div>
			<div class="front-hero__stats">
				<div class="front-hero__stat">
					<span class="front-hero__stat-value"><?= esc_html( $music_total ); ?></span>
					<span class="front-hero__stat-label">musiques</span>
				</div>
				<div class="front-hero__stat">
					<span class="front-hero__stat-value"><?= esc_html( $artist_total ); ?></span>
					<span class="front-hero__stat-label">artistes</span>
				</div>
				<div class="front-hero__stat">
					<span class="front-hero__stat-value"><?= esc_html( $album_total ); ?></span>
					<span class="front-hero__stat-label">albums</span>
				</div>
			</div>
			<p class="front-hero__body">
				<b>PepseeActus</b> répertorie déjà <b><?= esc_html( $music_total ); ?></b> musiques,
				<b><?= esc_html( $album_total ); ?></b> albums, <b><?= esc_html( $riddim_total ); ?></b> riddims,
				<b><?= esc_html( $beatmaker_total ); ?></b> beatmakers et <b><?= esc_html( $artist_total ); ?></b> artistes.
			</p>
			<p class="front-hero__body front-hero__body--muted">
				Depuis le début de l'année 2026 : <b><?= esc_html( $music_recent ); ?></b> musiques,
				<b><?= esc_html( $album_recent ); ?></b> albums, <b><?= esc_html( $riddim_recent ); ?></b> riddims,
				<b><?= esc_html( $beatmaker_recent ); ?></b> beatmakers et <b><?= esc_html( $artist_recent ); ?></b> artistes ajoutés.
			</p>
			<ul class="front-hero__quicklinks">
				<?php if ( $music_archive ) : ?>
					<li><a href="<?= esc_url( $music_archive ); ?>">Trending songs</a></li>
				<?php endif; ?>
				<?php if ( $artist_archive ) : ?>
					<li><a href="<?= esc_url( $artist_archive ); ?>">Fiches artistes</a></li>
				<?php endif; ?>
				<?php if ( $album_archive ) : ?>
					<li><a href="<?= esc_url( $album_archive ); ?>">Albums & mixtapes</a></li>
				<?php endif; ?>
				<?php if ( $riddim_archive ) : ?>
					<li><a href="<?= esc_url( $riddim_archive ); ?>">Riddims</a></li>
				<?php endif; ?>
			</ul>
		</div>
		<div class="front-hero__social">
			<?php get_template_part( 'parts/social-stat' ); ?>
		</div>
	</div>
</section>
