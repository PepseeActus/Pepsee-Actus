<?php
function pepsee_post_types() {
    // Artistes Post Type
    register_post_type('artist', [
        'supports'     => ['title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'rewrite'      => ['slug' => 'artist'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon'    => 'dashicons-universal-access',
        'labels'       => [
            'name'          => 'Artistes',
            'add_new_item'  => 'Ajouter un nouvel artiste',
            'edit_item'     => 'Éditer un artiste',
            'all_items'     => 'Tous les artistes',
            'singular_name' => 'Artiste'
        ]
    ]);

    // Music Post Type
    register_post_type('music', [
        'supports'     => ['title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'rewrite'      => ['slug' => 'music'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon' => 'dashicons-format-audio',
        'labels'    => [
            'name'          => 'Musique',
            'add_new_item'  => 'Ajouter une nouveau son',
            'edit_item'     => 'Éditer un son',
            'all_items'     => 'Tous les sons',
            'singular_name' => 'Musique'
        ]
    ]);

    // Album Post Type
    register_post_type('album', [
        'supports'     => ['title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'rewrite'      => ['slug' => 'album'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon'    => 'dashicons-album',
        'labels' => [
            'name'          => 'Album',
            'add_new_item'  => 'Ajouter un nouvel album',
            'edit_item'     => 'Éditer un album',
            'all_items'     => 'Tous les albums',
            'singular_name' => 'Album'
        ]
    ]);
}

add_action('init', 'pepsee_post_types');