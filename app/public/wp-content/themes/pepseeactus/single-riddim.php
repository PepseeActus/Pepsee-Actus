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
	$label              = get_field( 'label' );
	$spotify            = get_field( 'spotify' );
	$beatmakers         = get_field( 'beatmaker' );
	$genres             = get_field( 'genres' );
	if ( empty( $genres ) ) {
		$genres = get_the_terms( get_the_ID(), 'genres' );
	}
	$mixs                = get_field( 'mix' );
	$masterings          = get_field( 'mastering' );
	$credits_more        = trim( (string) get_field( 'more' ) );
	$compositeur         = trim( (string) get_field( 'compositeur' ) );
	$artistes_principal  = (array) get_field( 'artistes_principal' );
	$artistes_associes   = (array) get_field( 'artistes_associes' );
	$related_artist_ids  = array_values( array_unique( array_merge( $artistes_principal, $artistes_associes ) ) );
	$associated_cards    = pepsee_prepare_people_cards( $related_artist_ids );
	$genre_tags          = pepsee_prepare_text_tags( $genres );
	$discovery_posts     = pepsee_get_related_posts_by_acf_relationship( 'riddim', array( 'artistes_principal', 'artistes_associes' ), $related_artist_ids, array( get_the_ID() ), 3 );

	if ( empty( $discovery_posts ) ) {
		$discovery_posts = pepsee_get_recent_posts_by_type( 'riddim', array( get_the_ID() ), 3 );
	}

	$credit_items = array_filter(
		array(
			array(
				'label' => 'Beatmaker',
				'value' => implode( ' / ', pepsee_prepare_post_link_items( $beatmakers ) ),
			),
			array(
				'label' => 'Compositeur',
				'value' => esc_html( $compositeur ),
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
			'type_label'        => 'Riddim',
			'type_slug'         => 'riddim',
			'title'             => get_the_title(),
			'cover_id'          => get_post_thumbnail_id(),
			'cover_class'       => 'rotate',
			'meta_items'        => array_values(
				array_filter(
					array(
						get_the_date( 'd F Y' ),
						$label ? wp_strip_all_tags( $label ) : '',
					)
				)
			),
			'tags'              => $genre_tags,
			'associated_cards'  => $associated_cards,
			'spotify_args'      => $spotify ? array(
				'spotify'     => $spotify,
				'eyebrow'     => 'Riddim',
				'title'       => get_the_title(),
				'cover_id'    => get_post_thumbnail_id(),
				'description' => 'Le redesign prépare un bloc d’écoute premium sans jamais altérer l’embed officiel Spotify.',
				'meta_items'  => array_values(
					array_filter(
						array(
							'Sortie ' . get_the_date( 'd F Y' ),
							$label ? wp_strip_all_tags( $label ) : '',
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
