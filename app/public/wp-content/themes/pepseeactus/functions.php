<?php
require get_theme_file_path('/inc/search-route.php');
require_once "libs/aq_resizer.php";
require_once "libs/Mobile_Detect.php";

add_action( 'after_setup_theme', 'pepseeactus_setup' );
if ( ! function_exists( 'pepseeactus_setup' ) ) :
	/**
	 * Sets up theme defaults and registers support for various WordPress features.
	 *
	 * Note that this function is hooked into the after_setup_theme hook, which
	 * runs before the init hook. The init hook is too late for some features, such
	 * as indicating support for post thumbnails.
	 */
	function pepseeactus_setup() {
		/*
		* Make theme available for translation.
		* Translations can be filed in the /languages/ directory.
		* If you're building a theme based on components, use a find and replace
		* to change 'pepseeactus' to the name of your theme in all the template files.
		*/
		load_theme_textdomain( 'pepseeactus', get_template_directory() . '/languages' );

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		* Let WordPress manage the document title.
		* By adding theme support, we declare that this theme does not use a
		* hard-coded <title> tag in the document head, and expect WordPress to
		* provide it for us.
		*/
		add_theme_support( 'title-tag' );

		/*
		* Enable support for Post Thumbnails on posts and pages.
		*
		* @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		*/
		add_theme_support( 'post-thumbnails' );

		// Logo du site
		add_theme_support( 'custom-logo', array(
			'height'      => 200,
			'width'       => 200,
			'flex-width'  => true,
			'flex-height' => true,
		) );

		/*
		* Switch default core markup for search form, comment form, and comments
		* to output valid HTML5.
		*/
		add_theme_support( 'html5', array(
			'search-form',
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
		) );
	}
endif;

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
add_action( 'after_setup_theme', 'pepseeactus_content_width', 0 );
function pepseeactus_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'pepseeactus_content_width', 640 );
}

// CSS & JavaScript et autres scripts
add_action( 'wp_enqueue_scripts', 'pepseeactus_scripts' );
function pepseeactus_scripts() {
	wp_deregister_script('jquery');
	wp_register_script('jquery', 'https://code.jquery.com/jquery-3.4.1.js', [], false, true);	
	wp_register_style('bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css', []);
	wp_register_script('bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js', ['popper', 'jquery'], false, true);
	wp_register_style('swiperjs', 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css', []);
	wp_register_script('swiperjs', 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js', [], false, true);
	wp_register_script('popper', 'https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js', [], false, true);

	wp_enqueue_style('bootstrap');
	wp_enqueue_style('swiperjs');
	wp_enqueue_style('pepseeactus-style', get_stylesheet_uri(), array(), filemtime(get_template_directory() . '/style.css'), false);

	wp_enqueue_script('bootstrap');
	wp_enqueue_script('swiperjs');
}

add_action( 'wp_enqueue_scripts', 'pepsee_script');
function pepsee_script() {
	// absolutely need it, because we will get $wp_query->query_vars and $wp_query->max_num_pages from it.
	global $wp_query;

	// when you use wp_localize_script(), do not enqueue the target script immediately
	wp_register_script( 'pepsee_scripts', get_template_directory_uri() . '/assets/js/app.js', array('jquery') );

	wp_localize_script('pepsee_scripts', 'pepseeData', array(
		'root_url' => get_site_url()
	));

	// passing parameters here
	// actually the <script> tag will be created and the object "pepsee_loadmore_params" will be inside it 
	wp_localize_script( 'pepsee_scripts', 'pepsee_loadmore_params', array(
		'ajaxurl' => site_url() . '/wp-admin/admin-ajax.php', // WordPress AJAX
		'posts' => json_encode( $wp_query->query_vars ), // everything about your loop is here
		'current_page' => $wp_query->query_vars['paged'] ? $wp_query->query_vars['paged'] : 1,
		'max_page' => $wp_query->max_num_pages
	) );

	wp_enqueue_script( 'pepsee_scripts' );
}

add_action( 'wp_enqueue_scripts', 'pepsee_enqueue_dynamic_color_assets' );
function pepsee_enqueue_dynamic_color_assets() {
	if ( is_singular( 'music' ) ) {
		wp_enqueue_script(
			'color-thief',
			'https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.3.2/color-thief.umd.js',
			array(),
			'2.3.2',
			true
		);

		$dynamic_color_path    = get_stylesheet_directory() . '/js/pepsee-dynamic-color.js';
		$dynamic_color_version = file_exists( $dynamic_color_path ) ? filemtime( $dynamic_color_path ) : '1.0.0';

		wp_enqueue_script(
			'pepsee-dynamic-color',
			get_stylesheet_directory_uri() . '/js/pepsee-dynamic-color.js',
			array( 'color-thief' ),
			$dynamic_color_version,
			true
		);
	}
}

//Rajoute le type module au javascript
add_filter('script_loader_tag', 'add_type_attribute' , 10, 3);
function add_type_attribute($tag, $handle, $src) {
    // if not your script, do nothing and return original $tag
    if ( 'pepsee_scripts' !== $handle ) {
        return $tag;
    }
    // change the script tag by adding type="module" and return it.
    $tag = '<script type="module" src="' . esc_url( $src ) . '"></script>';
    return $tag;
}

// Longueur du résumé
add_filter( 'excerpt_length', function($length) {
    return 10;
} );

add_filter('excerpt_more', 'new_excerpt_more');
function new_excerpt_more( $more ) {
    return '';
}

// Template spécial "share card" pour les single music : ?share-card=1
add_filter( 'template_include', 'pepsee_music_share_card_template' );
function pepsee_music_share_card_template( $template ) {
	if ( is_singular( 'music' ) && isset( $_GET['share-card'] ) && '1' === $_GET['share-card'] ) {
		$share_template = get_stylesheet_directory() . '/single-music-share-card.php';
		if ( file_exists( $share_template ) ) {
			return $share_template;
		}
	}

	return $template;
}

function pepsee_get_spotify_embed_data( $spotify_value ) {
	if ( empty( $spotify_value ) || ! is_string( $spotify_value ) ) {
		return null;
	}

	$spotify_value = trim( $spotify_value );
	$matches       = array();

	if ( preg_match( '~spotify:(track|album|playlist|episode|show):([A-Za-z0-9]+)~i', $spotify_value, $matches ) ) {
		$type = strtolower( $matches[1] );
		$id   = $matches[2];
	} elseif ( preg_match( '~open\.spotify\.com/(?:intl-[a-z]{2}/)?(track|album|playlist|episode|show)/([A-Za-z0-9]+)~i', $spotify_value, $matches ) ) {
		$type = strtolower( $matches[1] );
		$id   = $matches[2];
	} else {
		return null;
	}

	return array(
		'type'          => $type,
		'id'            => $id,
		'canonical_url' => sprintf( 'https://open.spotify.com/%1$s/%2$s', $type, $id ),
		'embed_url'     => sprintf( 'https://open.spotify.com/embed/%1$s/%2$s?utm_source=generator', $type, $id ),
	);
}

function pepsee_prepare_people_cards( $entities ) {
	$cards = array();

	foreach ( array_filter( (array) $entities ) as $entity ) {
		$post_object = get_post( $entity );

		if ( ! $post_object instanceof WP_Post ) {
			continue;
		}

		$cards[] = array(
			'id'       => $post_object->ID,
			'url'      => get_permalink( $post_object ),
			'title'    => get_the_title( $post_object ),
			'image'    => get_the_post_thumbnail_url( $post_object, 'medium' ),
			'verified' => (bool) get_field( 'compte_verifie', $post_object->ID ),
			'type'     => get_post_type( $post_object ),
		);
	}

	return $cards;
}

function pepsee_normalize_related_ids( $entities ) {
	$ids = array();

	foreach ( array_filter( (array) $entities ) as $entity ) {
		$id = 0;

		if ( $entity instanceof WP_Post ) {
			$id = (int) $entity->ID;
		} elseif ( is_object( $entity ) && isset( $entity->ID ) ) {
			$id = (int) $entity->ID;
		} elseif ( is_numeric( $entity ) ) {
			$id = (int) $entity;
		} elseif ( is_array( $entity ) && isset( $entity['ID'] ) ) {
			$id = (int) $entity['ID'];
		}

		if ( $id > 0 ) {
			$ids[ $id ] = $id;
		}
	}

	return array_values( $ids );
}

function pepsee_format_artist_display( $artists ) {
	if ( is_string( $artists ) ) {
		return trim( $artists );
	}

	$names = array();

	foreach ( array_filter( (array) $artists ) as $artist ) {
		$name = '';

		if ( $artist instanceof WP_Post ) {
			$name = get_the_title( $artist );
		} elseif ( is_numeric( $artist ) ) {
			$name = get_the_title( (int) $artist );
		} elseif ( is_array( $artist ) && ! empty( $artist['post_title'] ) ) {
			$name = $artist['post_title'];
		}

		if ( $name ) {
			$names[] = $name;
		}
	}

	return implode( ' / ', array_unique( $names ) );
}

function pepsee_prepare_post_link_items( $entities ) {
	$items = array();

	foreach ( array_filter( (array) $entities ) as $entity ) {
		$post_object = get_post( $entity );

		if ( ! $post_object instanceof WP_Post ) {
			continue;
		}

		$items[] = sprintf(
			'<a href="%s"><b>%s</b></a>',
			esc_url( get_permalink( $post_object ) ),
			esc_html( get_the_title( $post_object ) )
		);
	}

	return $items;
}

function pepsee_prepare_term_link_items( $terms ) {
	$items = array();

	foreach ( array_filter( (array) $terms ) as $term ) {
		if ( $term instanceof WP_Term ) {
			$items[] = sprintf(
				'<a href="%s">%s</a>',
				esc_url( get_term_link( $term ) ),
				esc_html( $term->name )
			);
			continue;
		}

		if ( is_numeric( $term ) ) {
			$term_object = get_term( (int) $term );

			if ( $term_object instanceof WP_Term && ! is_wp_error( $term_object ) ) {
				$items[] = sprintf(
					'<a href="%s">%s</a>',
					esc_url( get_term_link( $term_object ) ),
					esc_html( $term_object->name )
				);
			}

			continue;
		}

		if ( is_string( $term ) && '' !== trim( $term ) ) {
			$items[] = esc_html( trim( $term ) );
		}
	}

	return $items;
}

function pepsee_prepare_text_tags( $items ) {
	$tags = array();

	foreach ( array_filter( (array) $items ) as $item ) {
		if ( $item instanceof WP_Term ) {
			$tags[] = $item->name;
		} elseif ( is_string( $item ) && '' !== trim( $item ) ) {
			$tags[] = trim( $item );
		}
	}

	return array_values( array_unique( $tags ) );
}

function pepsee_get_related_posts_by_acf_relationship( $post_type, $field_names, $related_ids, $exclude_ids = array(), $limit = 3 ) {
	$related_ids = array_values( array_unique( array_filter( array_map( 'intval', (array) $related_ids ) ) ) );
	$field_names = array_values( array_filter( (array) $field_names ) );
	$exclude_ids = array_values( array_unique( array_filter( array_map( 'intval', (array) $exclude_ids ) ) ) );

	if ( empty( $related_ids ) || empty( $field_names ) ) {
		return array();
	}

	$meta_query = array( 'relation' => 'OR' );

	foreach ( $field_names as $field_name ) {
		foreach ( $related_ids as $related_id ) {
			$meta_query[] = array(
				'key'     => $field_name,
				'value'   => '"' . $related_id . '"',
				'compare' => 'LIKE',
			);
		}
	}

	return get_posts(
		array(
			'post_type'           => $post_type,
			'post_status'         => 'publish',
			'posts_per_page'      => $limit,
			'post__not_in'        => $exclude_ids,
			'meta_query'          => $meta_query,
			'ignore_sticky_posts' => true,
		)
	);
}

function pepsee_get_recent_posts_by_type( $post_type, $exclude_ids = array(), $limit = 3 ) {
	return get_posts(
		array(
			'post_type'           => $post_type,
			'post_status'         => 'publish',
			'posts_per_page'      => $limit,
			'post__not_in'        => array_filter( array_map( 'intval', (array) $exclude_ids ) ),
			'ignore_sticky_posts' => true,
		)
	);
}

function pepsee_prepare_discovery_cards( $posts ) {
	$cards = array();

	foreach ( array_filter( (array) $posts ) as $post_object ) {
		$post_object = get_post( $post_object );

		if ( ! $post_object instanceof WP_Post ) {
			continue;
		}

		$post_type = get_post_type( $post_object );
		$subtitle  = '';
		$title     = get_the_title( $post_object );

		if ( in_array( $post_type, array( 'music', 'album' ), true ) ) {
			$subtitle = trim( (string) get_field( 'artistes', $post_object->ID ) );
			$acf_title = trim( (string) get_field( 'titre', $post_object->ID ) );

			if ( '' !== $acf_title ) {
				$title = $acf_title;
			}
		}

		$cards[] = array(
			'url'      => get_permalink( $post_object ),
			'title'    => $title,
			'subtitle' => $subtitle,
			'image'    => get_the_post_thumbnail_url( $post_object, 'medium_large' ),
			'eyebrow'  => get_post_type_object( $post_type )->labels->singular_name ?? ucfirst( $post_type ),
		);
	}

	return $cards;
}

function pepsee_sort_posts_by_date_desc( $posts ) {
	$posts = array_filter( (array) $posts );

	usort(
		$posts,
		function ( $left, $right ) {
			$left_post  = get_post( $left );
			$right_post = get_post( $right );

			if ( ! $left_post instanceof WP_Post || ! $right_post instanceof WP_Post ) {
				return 0;
			}

			return strcmp( $right_post->post_date, $left_post->post_date );
		}
	);

	return $posts;
}

function pepsee_prepare_media_cards( $posts ) {
	$cards = array();

	foreach ( array_filter( (array) $posts ) as $post_object ) {
		$post_object = get_post( $post_object );

		if ( ! $post_object instanceof WP_Post ) {
			continue;
		}

		$post_type   = get_post_type( $post_object );
		$post_object_type = get_post_type_object( $post_type );
		$title       = get_the_title( $post_object );
		$subtitle    = '';
		$date_format = 'F Y';
		$thumb_shape = 'square';

		if ( in_array( $post_type, array( 'music', 'album', 'riddim' ), true ) ) {
			$acf_title = trim( (string) get_field( 'titre', $post_object->ID ) );
			$artistes  = pepsee_format_artist_display( get_field( 'artistes', $post_object->ID ) );

			if ( '' !== $acf_title ) {
				$title = $acf_title;
			}

			if ( '' !== $artistes ) {
				$subtitle = $artistes;
			}
		}

		if ( 'music' === $post_type ) {
			$thumb_shape = 'circle';
		}

		if ( in_array( $post_type, array( 'album', 'riddim' ), true ) && get_the_time( 'Y', $post_object ) < 2015 ) {
			$date_format = 'Y';
		}

		$cards[] = array(
			'url'         => get_permalink( $post_object ),
			'title'       => $title,
			'subtitle'    => $subtitle,
			'eyebrow'     => $post_object_type->labels->singular_name ?? ucfirst( $post_type ),
			'date'        => get_the_date( $date_format, $post_object ),
			'image'       => get_the_post_thumbnail_url( $post_object, 'medium' ),
			'image_alt'   => get_the_title( $post_object ),
			'thumb_shape' => $thumb_shape,
		);
	}

	return $cards;
}

// Format de date sur les posts
function meks_time_ago() {
	return 'Il y a '.human_time_diff( get_the_time( 'U' ), current_time( 'timestamp' ) );
}

// Logo personnalisé lors du login
add_action('login_head', 'childtheme_custom_login');
function childtheme_custom_login() {
	echo '<link rel="stylesheet" type="text/css" href="' . get_bloginfo('stylesheet_directory') . '/login.css" />';
}

// Pagination
if ( !function_exists( 'theme_pagination' ) ) {
    function theme_pagination() {
		global $wp_query, $wp_rewrite;
		$wp_query->query_vars['paged'] > 1 ? $current = $wp_query->query_vars['paged'] : $current = 1;
		$pagination = array(
			'base' => @add_query_arg('page','%#%'),
			'format' => '',
			'total' => $wp_query->max_num_pages,
			'current' => $current,
			'show_all' => false,
			'end_size' => 1,
			'mid_size' => 2,
			'type' => 'list',
			'next_text' => 'Suivant »',
			'prev_text' => '« Précédent'
		);
		if( $wp_rewrite->using_permalinks() )
			$pagination['base'] = user_trailingslashit( trailingslashit( remove_query_arg( 's', get_pagenum_link( 1 ) ) ) . 'page/%#%/', 'paged' );
		if( !empty($wp_query->query_vars['s']) )
			$pagination['add_args'] = array( 's' => str_replace( ' ' , '+', get_query_var( 's' ) ) );
		echo str_replace('page/1/','', paginate_links( $pagination ) );
    }	
}

// Glossaire
add_shortcode('list_glossary_posts', 'list_glossary_posts');
function is_post_type($type){
    global $wp_query;
    if ( $type == get_post_type($wp_query->post->ID) ) 
        return true;
    return false;
}

function list_glossary_posts() {
	global $post;
	if (is_post_type('artist')) {
		$args = [
			'posts_per_page' => -1,
			'post_type' => 'artist',
			'orderby'=> 'title',
			'order' => 'ASC'
		];
	} else {
		$args = [
			'posts_per_page' => -1,
			'post_type' => 'beatmaker',
			'orderby'=> 'title',
			'order' => 'ASC'
		];
	}

	$postslist = get_posts( $args );
	ob_start();
	$previous_letter = null;
	foreach ( $postslist as $post ) :
		setup_postdata( $post );
		$glossary_title = $post->post_title;
		$glossary_letter = substr($glossary_title[0], 0, 1);
		if ( $glossary_letter !== $previous_letter ):
			if ( $previous_letter !== "a" && $previous_letter !== null ): ?>
				</div>
			<?php endif; ?>
			<div class="group">
				<h3 class="letter"><span><?php echo $glossary_letter; ?></span></h3>
		<?php endif; ?>
		<div class="bloc-letter">
			<a href="<?php the_permalink(); ?>"><?php echo $glossary_title; ?></a>
		</div>
		<?php $previous_letter = $glossary_letter; ?>
	<?php endforeach; ?>
	</div>
	<?php wp_reset_postdata();
	$output = ob_get_clean();
	return $output;
}

add_action( 'widgets_init', 'pepseeactus_widgets_init' );
function pepseeactus_widgets_init() {
    register_sidebar([
        'name'          => __( 'Blog Sidebar', 'pepseeactus' ),
        'id'            => 'sidebar-1',
        'description'   => __( 'Ajouter les widgets ici.', 'pepseeactus' ),
        'before_widget' => '<section class="widget %2$s">',
        'after_widget'  => '</section>',
        'before_title'  => '<h3 class="widget-title">',
        'after_title'   => '</h3>',
	]);
}

// Retirer le mot Archive du titre des pages archives
add_filter( 'get_the_archive_title', function ($title) {    
	if ( is_category() ) {    
			$title = single_cat_title( '', false );    
		} elseif ( is_tag() ) {    
			$title = single_tag_title( '', false );    
		} elseif ( is_author() ) {    
			$title = '<span class="vcard">' . get_the_author() . '</span>' ;    
		} elseif ( is_tax() ) { //for custom post types
			$title = sprintf( __( '%1$s' ), single_term_title( '', false ) );
		} elseif (is_post_type_archive()) {
			$title = post_type_archive_title( '', false );
		}
	return $title;    
});

// Load posts en AJAX sur la page archive music
add_action('wp_ajax_loadmorebutton', 'pepsee_loadmore_ajax_handler');
add_action('wp_ajax_nopriv_loadmorebutton', 'pepsee_loadmore_ajax_handler');
function pepsee_loadmore_ajax_handler(){
	// prepare our arguments for the query
	$params = json_decode( stripslashes( $_POST['query'] ), true ); // query_posts() takes care of the necessary sanitization 
	$params['paged'] = $_POST['page'] + 1; // we need next page to be loaded
	$params['post_status'] = 'publish';
	$params['post_type'] = array('music');

	// it is always better to use WP_Query but not here
	query_posts( $params );

	if( have_posts() ) :

		// run the loop
		while( have_posts() ): the_post(); ?>

		<div class="post-item col-12 col-md-6">
			<?php
				$artistes = get_field('artistes');
				$titre = get_field('titre');
			?>
			<a class="rotate" href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
			<div>
				<a href="<?php the_permalink(); ?>"><?= $artistes; ?></a>
				<a href="<?php the_permalink(); ?>"><?= $titre; ?></a>
				<?php the_date('M Y') ?>
			</div>
		</div>

		<?php endwhile;
	endif;
	die; // here we exit the script and even no wp_reset_query() required!
}

//Filtre de la page archive musique
add_action('wp_ajax_pepseefilter', 'pepsee_filter_function'); 
add_action('wp_ajax_nopriv_pepseefilter', 'pepsee_filter_function');
function pepsee_filter_function(){
	// example: date-ASC 
	$order = explode( '-', $_POST['pepsee_order_by'] );
	$year = $_POST['pepsee_year'];

	$params = array(
		'posts_per_page' => $_POST['pepsee_number_of_results'], // when set to -1, it shows all posts
		'year' => $year,
		'post_type' => array('music'),
		'orderby' => $order[0], // example: date
		'order'	=> $order[1] // example: ASC
	);

	query_posts( $params );
	global $wp_query;
	if( have_posts() ) :
		ob_start(); // start buffering because we do not need to print the posts now
		while( have_posts() ): the_post(); ?>
		<div class="post-item col-12 col-md-6">
			<?php
				$artistes = get_field('artistes');
				$titre = get_field('titre');
			?>
			<a class="rotate" href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
			<div class="media-card-row__info media-listing__info">
				<a href="<?php the_permalink(); ?>"><?= $artistes; ?></a>
				<a class="media-card-row__title media-listing__title" href="<?php the_permalink(); ?>"><?= $titre; ?></a>
				<?php the_date('M Y') ?>
			</div>
		</div>
		<?php endwhile;
		$posts_html = ob_get_contents(); // we pass the posts to variable
		ob_end_clean(); // clear the buffer
	else:
		$posts_html = '<p>Nothing found for your criteria.</p>';
	endif;
	// no wp_reset_query() required
	echo json_encode( array(
		'posts' => json_encode( $wp_query->query_vars ),
		'max_page' => $wp_query->max_num_pages,
		'found_posts' => $wp_query->found_posts,
		'content' => $posts_html
	) );
	die();
}

// First, make sure Jetpack doesn't concatenate all its CSS
add_filter( 'jetpack_implode_frontend_css', '__return_false' );
add_action('wp_print_styles', 'jeherve_remove_all_jp_css' );
// Then, remove each CSS file, one at a time
function jeherve_remove_all_jp_css() {
  wp_deregister_style( 'AtD_style' ); // After the Deadline
  wp_deregister_style( 'jetpack_likes' ); // Likes
  wp_deregister_style( 'jetpack_related-posts' ); //Related Posts
  wp_deregister_style( 'jetpack-carousel' ); // Carousel
  wp_deregister_style( 'grunion.css' ); // Grunion contact form
  wp_deregister_style( 'the-neverending-homepage' ); // Infinite Scroll
  wp_deregister_style( 'infinity-twentyten' ); // Infinite Scroll - Twentyten Theme
  wp_deregister_style( 'infinity-twentyeleven' ); // Infinite Scroll - Twentyeleven Theme
  wp_deregister_style( 'infinity-twentytwelve' ); // Infinite Scroll - Twentytwelve Theme
  wp_deregister_style( 'noticons' ); // Notes
  wp_deregister_style( 'post-by-email' ); // Post by Email
  wp_deregister_style( 'publicize' ); // Publicize
  wp_deregister_style( 'sharedaddy' ); // Sharedaddy
  wp_deregister_style( 'sharing' ); // Sharedaddy Sharing
  wp_deregister_style( 'stats_reports_css' ); // Stats
  wp_deregister_style( 'jetpack-widgets' ); // Widgets
  wp_deregister_style( 'jetpack-slideshow' ); // Slideshows
  wp_deregister_style( 'presentations' ); // Presentation shortcode
  wp_deregister_style( 'jetpack-subscriptions' ); // Subscriptions
  wp_deregister_style( 'tiled-gallery' ); // Tiled Galleries
  wp_deregister_style( 'widget-conditions' ); // Widget Visibility
  wp_deregister_style( 'jetpack_display_posts_widget' ); // Display Posts Widget
  wp_deregister_style( 'gravatar-profile-widget' ); // Gravatar Widget
  wp_deregister_style( 'widget-grid-and-list' ); // Top Posts widget
  wp_deregister_style( 'jetpack-widgets' ); // Widgets
}

// Fonction "see more" pour charger les musiques en Ajax
add_action('wp_ajax_load_music', 'load_music');
add_action('wp_ajax_nopriv_load_music', 'load_music');
function load_music() {
	$music_ids = $_POST['music_ids'];
	$args = array(
		'post_type' => 'music',
		'post__in' => $music_ids,
		'orderby' => 'post__in',
	);
	$query = new WP_Query( $args );
	if ( $query->have_posts() ) {
		while ( $query->have_posts() ) {
			$query->the_post();
			setup_postdata( $post );
			$artistes = get_field('artistes');
			$titre = get_field('titre');?>
				<div class="artist-music__container-box media-card-row col-12 col-md-6">
					<div class="music-image media-card-row__thumb rotate">
						<a href="<?= get_the_permalink($post); ?>">
							<img src="<?= get_the_post_thumbnail_url($post, 'thumbnail'); ?>" alt="<?= get_the_title($post); ?>">
						</a>
					</div>
					<div class="media-card-row__info media-listing__info">
						<a href="<?= get_the_permalink($post); ?>"><?= $artistes; ?></a>
						<a class="media-card-row__title media-listing__title" href="<?= get_the_permalink($post); ?>"><?= $titre; ?></a>
						<span>
							<?php echo get_the_date('F Y'); ?>
						</span>
						<?php get_template_part( 'parts/link-template' ); ?>
					</div>
				</div>
		<?php }
		wp_reset_postdata();
	}
	wp_die();
}

function get_custom_post_counts() {
    $types = ['music', 'album', 'artist', 'beatmaker', 'riddim'];
    $counts = [];

    // Total counts
    foreach ($types as $type) {
        $counts[$type]['total'] = wp_count_posts($type)->publish;
    }

    // Counts since 1st January 2025
    $start_date = '2026-01-01 00:00:00';
    foreach ($types as $type) {
        $args = [
            'post_type' => $type,
            'post_status' => 'publish',
            'date_query' => [
                'after' => $start_date,
            ],
            'posts_per_page' => -1,
            'fields' => 'ids',
        ];
        $query = new WP_Query($args);
        $counts[$type]['since_2025'] = $query->found_posts;
    }

    return $counts;
}

// Balises Open Graph pour les partages réseaux sociaux
function pepsee_custom_open_graph_tags() {
    if (is_singular('music') || is_singular('artist')) {
        global $post;

        $title = get_the_title($post);
        $description = get_field('titre') ?: get_the_excerpt($post);
        $image = get_the_post_thumbnail_url($post, 'large');
        $url = get_permalink($post);

        echo '<meta property="og:title" content="' . esc_attr($title) . '" />' . "\n";
        echo '<meta property="og:description" content="' . esc_attr($description) . '" />' . "\n";
        echo '<meta property="og:image" content="' . esc_url($image) . '" />' . "\n";
        echo '<meta property="og:url" content="' . esc_url($url) . '" />' . "\n";
        echo '<meta property="og:type" content="' . (is_singular('artist') ? 'profile' : 'music.song') . '" />' . "\n";

        // Twitter Card support
        echo '<meta name="twitter:card" content="summary_large_image" />' . "\n";
        echo '<meta name="twitter:title" content="' . esc_attr($title) . '" />' . "\n";
        echo '<meta name="twitter:description" content="' . esc_attr($description) . '" />' . "\n";
        echo '<meta name="twitter:image" content="' . esc_url($image) . '" />' . "\n";
    }
}
add_action('wp_head', 'pepsee_custom_open_graph_tags', 5);
