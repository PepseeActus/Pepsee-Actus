<?php
/*
 * Plugin Name:       My Block Templates
 * Version:           1.0
 * Author:            Le Peps
 */

function myplugin_register_my_block_template() {
	$post_type_object = get_post_type_object( 'music' );
	$post_type_object->template = array(
		array( 'core/html' ),
		array( 'core/embed' )
	);

	$album_type_object = get_post_type_object( 'album' );
	$album_type_object->template = array(
		array( 'core/heading', array(
			'content'	=> 'Tracklist',
			'level'			=> 2
		) ),
		array( 'core/list' ),
		array( 'core/html' )
	);

	$riddim_type_object = get_post_type_object( 'riddim' );
	$riddim_type_object->template = array(
		array( 'core/heading', array(
			'content'	=> 'Tracklist',
			'level'			=> 2
		) ),
		array( 'core/list' ),
		array( 'core/html' )
	);
}
add_action( 'init', 'myplugin_register_my_block_template' );