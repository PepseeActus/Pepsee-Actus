<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package PepseeActus
 */

get_header();

while ( have_posts() ) : the_post();
	$artistes             = get_field( 'artistes' );
	$artistes_associes    = get_field( 'artistes_associes' );
	$artistes_display     = pepsee_format_artist_display( $artistes );
	$titre                = trim( (string) get_field( 'titre' ) );
	$riddim               = trim( (string) get_field( 'riddim' ) );
	$spotify              = get_field( 'spotify' );
	$genres               = get_field( 'genres' );
	$beatmakers           = get_field( 'beatmaker' );
	$mixs                 = get_field( 'mix' );
	$masterings           = get_field( 'mastering' );
	$credits_more         = trim( (string) get_field( 'more' ) );
	$label                = get_field( 'label' );
	$albums_associes      = get_field( 'albums_associes' );
	$cover_id             = get_post_thumbnail_id();
	$genre_tags           = pepsee_prepare_text_tags( $genres );
	$related_artist_ids   = pepsee_normalize_related_ids( $artistes_associes );
	$associated_cards     = pepsee_prepare_people_cards( $related_artist_ids );
	$discovery_posts      = pepsee_get_related_posts_by_acf_relationship( 'music', 'artistes_associes', $related_artist_ids, array( get_the_ID() ), 3 );

	if ( empty( $discovery_posts ) ) {
		$discovery_posts = pepsee_get_recent_posts_by_type( 'music', array( get_the_ID() ), 3 );
	}

	$credit_items = array_filter(
		array(
			array(
				'label' => 'Titre',
				'value' => esc_html( $titre ?: get_the_title() ),
			),
			array(
				'label' => 'Riddim',
				'value' => $riddim ? esc_html( $riddim . ' Riddim' ) : '',
			),
			array(
				'label' => 'Artistes',
				'value' => is_array( $artistes ) ? implode( ' / ', pepsee_prepare_post_link_items( $artistes ) ) : esc_html( $artistes_display ),
			),
			array(
				'label' => 'Beatmaker',
				'value' => implode( ' / ', pepsee_prepare_post_link_items( $beatmakers ) ),
			),
			array(
				'label' => 'Genres',
				'value' => implode( ' / ', pepsee_prepare_term_link_items( $genres ) ),
			),
			array(
				'label' => 'Mix',
				'value' => implode( ' / ', pepsee_prepare_post_link_items( $mixs ) ),
			),
			array(
				'label' => 'Mastering',
				'value' => implode( ' / ', pepsee_prepare_post_link_items( $masterings ) ),
			),
			array(
				'label' => 'Label',
				'value' => $label ? wp_kses_post( $label ) : '',
			),
			array(
				'label' => 'Extrait de l’album',
				'value' => implode( ' / ', pepsee_prepare_post_link_items( $albums_associes ) ),
			),
			array(
				'label' => 'Notes',
				'value' => $credits_more ? wp_kses_post( $credits_more ) : '',
			),
			array(
				'label' => 'Date de sortie',
				'value' => esc_html( get_the_date( 'd F Y' ) ),
			),
		),
		static function ( $item ) {
			return ! empty( $item['value'] );
		}
	);

	get_template_part(
		'parts/media-detail-shell',
		null,
		array(
			'type_label'        => 'Single',
			'type_slug'         => 'music',
			'title'             => $titre ?: get_the_title(),
			'subtitle'          => $artistes_display,
			'cover_id'          => $cover_id,
			'cover_class'       => 'rotate',
			'meta_items'        => array_values(
				array_filter(
					array(
						$riddim ? 'Riddim ' . $riddim : '',
						get_the_date( 'd F Y' ),
					)
				)
			),
			'tags'              => $genre_tags,
			'associated_cards'  => $associated_cards,
			'spotify_args'      => $spotify ? array(
				'spotify'     => $spotify,
				'eyebrow'     => 'Single',
				'title'       => $titre ?: get_the_title(),
				'artist'      => $artistes_display,
				'cover_id'    => $cover_id,
				'description' => 'Le player reste l’embed officiel Spotify, intégré dans un conteneur éditorial premium pensé pour la découverte.',
				'meta_items'  => array_values(
					array_filter(
						array(
							$riddim ? sprintf( 'Riddim %s', $riddim ) : '',
							get_the_date( 'd F Y' ),
						)
					)
				),
				'tags'        => $genre_tags,
			) : array(),
			'credit_items'      => $credit_items,
			'content_html'      => apply_filters( 'the_content', get_the_content() ),
			'discovery_cards'   => pepsee_prepare_discovery_cards( $discovery_posts ),
		)
	);
endwhile;
get_footer();
