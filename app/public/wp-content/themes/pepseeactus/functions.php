<?php
require get_theme_file_path('/inc/search-route.php');

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

		add_image_size( 'pepseeactus-ArtistsFront', 380, 500, true );
		add_image_size( 'banner', 1280, 720, true );

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

		// Post format
		add_theme_support( 'post-formats', array(
			'video',
		) );
}
endif;
add_action( 'after_setup_theme', 'pepseeactus_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function pepseeactus_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'pepseeactus_content_width', 640 );
}
add_action( 'after_setup_theme', 'pepseeactus_content_width', 0 );

// Custom logo
function pepseeactus_the_custom_logo() {
	if ( ! function_exists( 'the_custom_logo' ) ) {
		return;
	} else {
		the_custom_logo();
	}
}

// CSS & JavaScript et autres scripts
function pepseeactus_scripts() {
	wp_register_style('bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css', []);
	wp_register_script('bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js', ['popper', 'jquery'], false, true);
	wp_register_style('swiperjs', 'https://unpkg.com/swiper/css/swiper.min.css', []);
	wp_register_script('popper', 'https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js', [], false, true);
	wp_deregister_script('jquery');
	wp_register_script('jquery', 'https://code.jquery.com/jquery-3.4.1.js', [], false, true);	
	wp_register_script('font-awesome', 'https://kit.fontawesome.com/628ddd9372.js', [], false, true);	
	
	wp_enqueue_style('bootstrap');
	wp_enqueue_style('pepseeactus-style', get_stylesheet_uri());

	wp_enqueue_script('bootstrap');
	wp_enqueue_script('font-awesome');
	wp_enqueue_script('pepseeactus-app', get_template_directory_uri() . '/assets/js/app.js', [], '', true);
	wp_localize_script('pepseeactus-app', 'pepseeData', array(
		'root_url' => get_site_url()
	));
	
	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'pepseeactus_scripts' );

// Longueur du résumé
add_filter( 'excerpt_length', function($length) {
    return 20;
} );

// Format de date sur les posts
function meks_time_ago() {
	return 'Il y a '.human_time_diff( get_the_time( 'U' ), current_time( 'timestamp' ) );
}

// Logo personnalisé lors du login
function childtheme_custom_login() {
	echo '<link rel="stylesheet" type="text/css" href="' . get_bloginfo('stylesheet_directory') . '/login.css" />';
}
add_action('login_head', 'childtheme_custom_login');

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
function list_glossary_posts() {
	global $post;
	$args = [
		'posts_per_page' => -1,
		'post_type' => 'artist',
		'orderby'=> 'title',
		'order' => 'ASC'
	];
	$postslist = get_posts( $args );
	ob_start();

	$previous_letter = null;
	foreach ( $postslist as $post ) :

		setup_postdata( $post );

		$glossary_title = $post->post_title;
		$glossary_letter = substr($glossary_title[0], 0, 1);

		if ( $glossary_letter !== $previous_letter ): ?>
			<h3 class="letter"><span><?php echo $glossary_letter; ?></span></h3>
		<?php endif; ?>
		<div class="bloc-letter">
			<a href="<?php the_permalink(); ?>"><?php echo $glossary_title; ?></a>
		</div>

		<?php $previous_letter = $glossary_letter;

	endforeach;

	wp_reset_postdata();

	$output = ob_get_clean();
	return $output;
}
add_shortcode('list_glossary_posts', 'list_glossary_posts');

// Sidebar & Widgets
require_once 'widgets/YoutubeWidget.php';

function pepseeactus_widgets_init() {
	register_widget(YoutubeWidget::class);
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
add_action( 'widgets_init', 'pepseeactus_widgets_init' );

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

// bi-directionnal update avec ACF
function bidirectional_acf_update_value( $value, $post_id, $field  ) {
	
	// vars
	$field_name = $field['name'];
	$field_key = $field['key'];
	$global_name = 'is_updating_' . $field_name;
	
	
	// bail early if this filter was triggered from the update_field() function called within the loop below
	// - this prevents an inifinte loop
	if( !empty($GLOBALS[ $global_name ]) ) return $value;
	
	
	// set global variable to avoid inifite loop
	// - could also remove_filter() then add_filter() again, but this is simpler
	$GLOBALS[ $global_name ] = 1;
	
	
	// loop over selected posts and add this $post_id
	if( is_array($value) ) {
	
		foreach( $value as $post_id2 ) {
			
			// load existing related posts
			$value2 = get_field($field_name, $post_id2, false);
			
			
			// allow for selected posts to not contain a value
			if( empty($value2) ) {
				
				$value2 = array();
				
			}
			
			
			// bail early if the current $post_id is already found in selected post's $value2
			if( in_array($post_id, $value2) ) continue;
			
			
			// append the current $post_id to the selected post's 'related_posts' value
			$value2[] = $post_id;
			
			
			// update the selected post's value (use field's key for performance)
			update_field($field_key, $value2, $post_id2);
			
		}
	
	}
	
	
	// find posts which have been removed
	$old_value = get_field($field_name, $post_id, false);
	
	if( is_array($old_value) ) {
		
		foreach( $old_value as $post_id2 ) {
			
			// bail early if this value has not been removed
			if( is_array($value) && in_array($post_id2, $value) ) continue;
			
			
			// load existing related posts
			$value2 = get_field($field_name, $post_id2, false);
			
			
			// bail early if no value
			if( empty($value2) ) continue;
			
			
			// find the position of $post_id within $value2 so we can remove it
			$pos = array_search($post_id, $value2);
			
			
			// remove
			unset( $value2[ $pos] );
			
			
			// update the un-selected post's value (use field's key for performance)
			update_field($field_key, $value2, $post_id2);
			
		}
		
	}
	
	
	// reset global varibale to allow this filter to function as per normal
	$GLOBALS[ $global_name ] = 0;
	
	
	// return
    return $value;
    
}

add_filter('acf/update_value/name=related_posts', 'bidirectional_acf_update_value', 10, 3);