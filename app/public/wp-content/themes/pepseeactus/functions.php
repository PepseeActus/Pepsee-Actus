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

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'pepseeactus_scripts' );

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
add_action( 'wp_enqueue_scripts', 'pepsee_script');

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
			<?php if ( $previous_letter !== "a" && $previous_letter !== null ): ?>
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

// Load posts en AJAX
add_action('wp_ajax_loadmorebutton', 'pepsee_loadmore_ajax_handler');
add_action('wp_ajax_nopriv_loadmorebutton', 'pepsee_loadmore_ajax_handler');

function pepsee_loadmore_ajax_handler(){

	// prepare our arguments for the query
	$params = json_decode( stripslashes( $_POST['query'] ), true ); // query_posts() takes care of the necessary sanitization 
	$params['paged'] = $_POST['page'] + 1; // we need next page to be loaded
	$params['post_status'] = 'publish';
	$params['post_type'] = array('music', 'album');

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

add_action('wp_ajax_pepseefilter', 'pepsee_filter_function'); 
add_action('wp_ajax_nopriv_pepseefilter', 'pepsee_filter_function');

function pepsee_filter_function(){

	// example: date-ASC 
	$order = explode( '-', $_POST['pepsee_order_by'] );
	$year = $_POST['pepsee_year'];
	
	
	$params = array(
		'posts_per_page' => $_POST['pepsee_number_of_results'], // when set to -1, it shows all posts
		'year' => $year,
		'post_type' => array('music', 'album'),
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
			<div class="music-infos">
				<a href="<?php the_permalink(); ?>"><?= $artistes; ?></a>
				<a href="<?php the_permalink(); ?>"><?= $titre; ?></a>
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

	/* 
		this function shows how to create a simple two way relationship field
		the example assumes that you are using either a single relationship field
		where posts of the same type are related or you can have 2 relationship
		fields on two different post types. this example also assumes that
		the relationship field(s) do not impose any limits on the number
		of selections
		
		The concept covered in this file has also been coverent on the ACF site
		on this page https://www.advancedcustomfields.com/resources/bidirectional-relationships/
		The example shown there is very similar, but requires but is created to work
		where the field name is the same, similar to my plugin that does this.
		This example will let you have fields of different names
	*/
	
	// add the filter for your relationship field
	add_filter('acf/update_value/key=field_5f75098b65988', 'acf_reciprocal_relationship', 10, 3);
	
	function acf_reciprocal_relationship($value, $post_id, $field) {
		
		// set the two fields that you want to create
		// a two way relationship for
		// these values can be the same field key
		// if you are using a single relationship field
		// on a single post type
		
		// the field key of one side of the relationship
		$key_a = 'field_5f75098b65988';
		// the field key of the other side of the relationship
		// as noted above, this can be the same as $key_a
		$key_b = 'field_5f75098b65988';
		
		// figure out wich side we're doing and set up variables
		// if the keys are the same above then this won't matter
		// $key_a represents the field for the current posts
		// and $key_b represents the field on related posts
		if ($key_a != $field['key']) {
			// this is side b, swap the value
			$temp = $key_a;
			$key_a = $key_b;
			$key_b = $temp;
		}
		
		// get both fields
		// this gets them by using an acf function
		// that can gets field objects based on field keys
		// we may be getting the same field, but we don't care
		$field_a = acf_get_field($key_a);
		$field_b = acf_get_field($key_b);
		
		// set the field names to check
		// for each post
		$name_a = $field_a['name'];
		$name_b = $field_b['name'];
		
		// get the old value from the current post
		// compare it to the new value to see
		// if anything needs to be updated
		// use get_post_meta() to a avoid conflicts
		$old_values = get_post_meta($post_id, $name_a, true);
		// make sure that the value is an array
		if (!is_array($old_values)) {
			if (empty($old_values)) {
				$old_values = array();
			} else {
				$old_values = array($old_values);
			}
		}
		// set new values to $value
		// we don't want to mess with $value
		$new_values = $value;
		// make sure that the value is an array
		if (!is_array($new_values)) {
			if (empty($new_values)) {
				$new_values = array();
			} else {
				$new_values = array($new_values);
			}
		}
		
		// get differences
		// array_diff returns an array of values from the first
		// array that are not in the second array
		// this gives us lists that need to be added
		// or removed depending on which order we give
		// the arrays in
		
		// this line is commented out, this line should be used when setting
		// up this filter on a new site. getting values and updating values
		// on every relationship will cause a performance issue you should
		// only use the second line "$add = $new_values" when adding this
		// filter to an existing site and then you should switch to the
		// first line as soon as you get everything updated
		// in either case if you have too many existing relationships
		// checking end updated every one of them will more then likely
		// cause your updates to time out.
		//$add = array_diff($new_values, $old_values);
		$add = $new_values;
		$delete = array_diff($old_values, $new_values);
		
		// reorder the arrays to prevent possible invalid index errors
		$add = array_values($add);
		$delete = array_values($delete);
		
		if (!count($add) && !count($delete)) {
			// there are no changes
			// so there's nothing to do
			return $value;
		}
		
		// do deletes first
		// loop through all of the posts that need to have
		// the recipricol relationship removed
		for ($i=0; $i<count($delete); $i++) {
			$related_values = get_post_meta($delete[$i], $name_b, true);
			if (!is_array($related_values)) {
				if (empty($related_values)) {
					$related_values = array();
				} else {
					$related_values = array($related_values);
				}
			}
			// we use array_diff again
			// this will remove the value without needing to loop
			// through the array and find it
			$related_values = array_diff($related_values, array($post_id));
			// insert the new value
			update_post_meta($delete[$i], $name_b, $related_values);
			// insert the acf key reference, just in case
			update_post_meta($delete[$i], '_'.$name_b, $key_b);
		}
		
		// do additions, to add $post_id
		for ($i=0; $i<count($add); $i++) {
			$related_values = get_post_meta($add[$i], $name_b, true);
			if (!is_array($related_values)) {
				if (empty($related_values)) {
					$related_values = array();
				} else {
					$related_values = array($related_values);
				}
			}
			if (!in_array($post_id, $related_values)) {
				// add new relationship if it does not exist
				$related_values[] = $post_id;
			}
			// update value
			update_post_meta($add[$i], $name_b, $related_values);
			// insert the acf key reference, just in case
			update_post_meta($add[$i], '_'.$name_b, $key_b);
		}
		
		return $value;
		
	} // end function acf_reciprocal_relationship
	
?>