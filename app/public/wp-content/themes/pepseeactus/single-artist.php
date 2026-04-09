<?php
/**
 * The template for displaying artist single posts.
 *
 * @package PepseeActus
 */

get_header();

while ( have_posts() ) :
	the_post();
	$badge          = (bool) get_field( 'compte_verifie' );
	$status         = get_field( 'status' );
	$nom            = get_field( 'nom' );
	$origine        = array_filter( (array) get_field( 'origine' ) );
	$genres         = get_field( 'genres' ) ?: array();
	$internet       = get_field( 'internet' );
	$parents        = get_field( 'parents' );
	$enfants        = get_field( 'enfants' );
	$siblings       = get_field( 'siblings' );
	$cousins        = get_field( 'cousins' );
	$music_posts    = pepsee_sort_posts_by_date_desc( get_field( 'musique_associees' ) );
	$albums_associes = pepsee_sort_posts_by_date_desc( get_field( 'albums_associes' ) );
	$albums_invites = pepsee_sort_posts_by_date_desc( get_field( 'albums_invites' ) );
	$riddims_associes = pepsee_sort_posts_by_date_desc( get_field( 'riddims_associes' ) );
	$actus_associes = pepsee_sort_posts_by_date_desc( get_field( 'actus_associes' ) );
	$naissance      = get_field( 'naissance', false, false );
	$deces          = get_field( 'deces', false, false );
	$date_affichee  = '';

	if ( $naissance ) {
		$date_naissance = new DateTime( $naissance );

		if ( $deces ) {
			$date_deces   = new DateTime( $deces );
			$age          = $date_deces->diff( $date_naissance )->y;
			$date_affichee = sprintf(
				'%1$s - %2$s (mort à %3$s ans)',
				date_i18n( 'j F Y', strtotime( $naissance ) ),
				date_i18n( 'j F Y', strtotime( $deces ) ),
				$age
			);
		} else {
			$age          = ( new DateTime() )->diff( $date_naissance )->y;
			$date_affichee = sprintf(
				'%1$s (%2$s ans)',
				date_i18n( 'j F Y', strtotime( $naissance ) ),
				$age
			);
		}
	}

	$fact_rows = array();

	if ( $nom ) {
		$fact_rows[] = array(
			'label' => __( 'Nom de naissance', 'pepseeactus' ),
			'value' => esc_html( $nom ),
		);
	}

	if ( $date_affichee ) {
		$fact_rows[] = array(
			'label' => __( 'Date de naissance', 'pepseeactus' ),
			'value' => esc_html( $date_affichee ),
		);
	}

	if ( ! empty( $origine ) ) {
		$fact_rows[] = array(
			'label' => __( 'Origine', 'pepseeactus' ),
			'value' => esc_html( implode( ' / ', $origine ) ),
		);
	}

	$genre_links = pepsee_prepare_term_link_items( $genres );
	if ( ! empty( $genre_links ) ) {
		$fact_rows[] = array(
			'label' => __( 'Genres musicaux', 'pepseeactus' ),
			'value' => implode( ' / ', $genre_links ),
		);
	}

	$relationship_map = array(
		array(
			'label'       => count( (array) $parents ) > 1 ? __( 'Parents', 'pepseeactus' ) : __( 'Parent', 'pepseeactus' ),
			'cards_label' => __( 'Parents & mentors', 'pepseeactus' ),
			'entities'    => $parents,
		),
		array(
			'label'       => count( (array) $enfants ) > 1 ? __( 'Enfants', 'pepseeactus' ) : __( 'Enfant', 'pepseeactus' ),
			'cards_label' => __( 'Descendance', 'pepseeactus' ),
			'entities'    => $enfants,
		),
		array(
			'label'       => count( (array) $siblings ) > 1 ? __( 'Frères et sœurs', 'pepseeactus' ) : __( 'Frère ou sœur', 'pepseeactus' ),
			'cards_label' => __( 'Fratrie', 'pepseeactus' ),
			'entities'    => $siblings,
		),
		array(
			'label'       => count( (array) $cousins ) > 1 ? __( 'Cousins', 'pepseeactus' ) : __( 'Cousin', 'pepseeactus' ),
			'cards_label' => __( 'Cercle proche', 'pepseeactus' ),
			'entities'    => $cousins,
		),
	);

	$network_groups = array();

	foreach ( $relationship_map as $relationship_group ) {
		$link_items = pepsee_prepare_post_link_items( $relationship_group['entities'] );
		$cards      = pepsee_prepare_people_cards( $relationship_group['entities'] );

		if ( ! empty( $link_items ) ) {
			$fact_rows[] = array(
				'label' => $relationship_group['label'],
				'value' => implode( ' / ', $link_items ),
			);
		}

		if ( ! empty( $cards ) ) {
			$network_groups[] = array(
				'label'       => $relationship_group['cards_label'],
				'description' => __( 'Des profils reliés pour prolonger la découverte sans casser la logique éditoriale.', 'pepseeactus' ),
				'cards'       => $cards,
			);
		}
	}

	if ( $internet ) {
		$fact_rows[] = array(
			'label' => __( 'Site web', 'pepseeactus' ),
			'value' => sprintf(
				'<a href="%1$s" target="_blank" rel="noopener noreferrer">%2$s</a>',
				esc_url( $internet ),
				esc_html( preg_replace( '#^https?://#', '', $internet ) )
			),
		);
	}

	$stats = array_filter(
		array(
			array(
				'label' => __( 'Singles', 'pepseeactus' ),
				'value' => count( $music_posts ),
			),
			array(
				'label' => __( 'Albums', 'pepseeactus' ),
				'value' => count( $albums_associes ) + count( $albums_invites ),
			),
			array(
				'label' => __( 'Riddims', 'pepseeactus' ),
				'value' => count( $riddims_associes ),
			),
			array(
				'label' => __( 'Actus', 'pepseeactus' ),
				'value' => count( $actus_associes ),
			),
		),
		function ( $stat ) {
			return ! empty( $stat['value'] );
		}
	);

	$discovery_sources = array();
	foreach ( array( $music_posts, $albums_associes, $riddims_associes, $actus_associes ) as $group ) {
		foreach ( array_filter( (array) $group ) as $group_post ) {
			$group_post = get_post( $group_post );

			if ( $group_post instanceof WP_Post ) {
				$discovery_sources[ $group_post->ID ] = $group_post;
			}
		}
	}

	if ( count( $discovery_sources ) < 4 ) {
		foreach ( pepsee_get_recent_posts_by_type( 'post', array( get_the_ID() ), 4 ) as $recent_post ) {
			$discovery_sources[ $recent_post->ID ] = $recent_post;
		}
	}

	get_template_part(
		'parts/artist-detail-shell',
		null,
		array(
			'title'             => get_the_title(),
			'verified'          => $badge,
			'status'            => $status,
			'cover_id'          => get_post_thumbnail_id(),
			'genres'            => pepsee_prepare_text_tags( $genres ),
			'origins'           => $origine,
			'stats'             => $stats,
			'fact_rows'         => $fact_rows,
			'narrative_html'    => apply_filters( 'the_content', get_the_content() ),
			'network_groups'    => $network_groups,
			'singles_cards'     => pepsee_prepare_media_cards( $music_posts ),
			'discography_cards' => pepsee_prepare_media_cards( $albums_associes ),
			'featured_cards'    => pepsee_prepare_media_cards( $albums_invites ),
			'riddim_cards'      => pepsee_prepare_media_cards( $riddims_associes ),
			'news_posts'        => array_slice( $actus_associes, 0, 6 ),
			'discovery_cards'   => pepsee_prepare_discovery_cards( array_slice( array_values( $discovery_sources ), 0, 6 ) ),
		)
	);
endwhile;

get_footer();
