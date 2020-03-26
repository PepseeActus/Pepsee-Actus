<?php
function pepsee_post_types() {
    //Artistes Post Type
    register_post_type('artist', [
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'thumbnail', 'excerpt'),
        'rewrite' => array('slug' => 'artist'),
        'has_archive' => true,
        'public' => true,
        'show_in_rest' => true,
        'labels' => array(
            'name' => 'Artistes',
            'add_new_item' => 'Ajouter un nouvel artiste',
            'edit_item' => 'Éditer un artiste',
            'all_items' => 'Tous les artistes',
            'singular_name' => 'Artiste'
        ),
        'menu_icon' => 'dashicons-universal-access'
    ]);

    //Music Post Type
    register_post_type('music', [
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'excerpt', 'thumbnail'),
        'rewrite' => array('slug' => 'music'),
        'has_archive' => true,
        'public' => true,
        'show_in_rest' => true,
        'labels' => array(
            'name' => 'Musique',
            'add_new_item' => 'Ajouter une nouveau son',
            'edit_item' => 'Éditer un son',
            'all_items' => 'Tous les sons',
            'singular_name' => 'Musique'
        ),
        'menu_icon' => 'dashicons-format-audio'
    ]);

    //Album Post Type
    register_post_type('album', [
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'excerpt', 'thumbnail'),
        'rewrite' => array('slug' => 'album'),
        'has_archive' => true,
        'public' => true,
        'show_in_rest' => true,
        'labels' => array(
            'name' => 'Album',
            'add_new_item' => 'Ajouter un nouvel album',
            'edit_item' => 'Éditer un album',
            'all_items' => 'Tous les albums',
            'singular_name' => 'Album'
        ),
        'menu_icon' => 'dashicons-album'
    ]);
}
add_action('init', 'pepsee_post_types');