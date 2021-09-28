<?php
function pepsee_post_types() {
    // Artistes Post Type
    register_post_type('artist', [
        'supports'     => ['title', 'editor', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'taxonomies'   => ['post_tag'],
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

    // Beatmakers Post Type
    register_post_type('beatmaker', [
        'supports'     => ['title', 'editor', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'taxonomies'   => ['post_tag'],
        'rewrite'      => ['slug' => 'beatmaker'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon'    => 'dashicons-universal-access',
        'labels'       => [
            'name'          => 'Beatmakers',
            'add_new_item'  => 'Ajouter un nouvel beatmaker',
            'edit_item'     => 'Éditer un beatmaker',
            'all_items'     => 'Tous les beatmakers',
            'singular_name' => 'Beatmaker'
        ]
    ]);

    // Music Post Type
    register_post_type('music', [
        'supports'     => ['title', 'editor', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'taxonomies'   => ['post_tag'],
        'rewrite'      => ['slug' => 'music'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon'    => 'dashicons-format-audio',
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
        'supports'     => ['title', 'editor', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'taxonomies'   => ['post_tag'],
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

    // Riddim Post Type
    register_post_type('riddim', [
        'supports'     => ['title', 'editor', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'],
        'taxonomies'   => ['post_tag'],
        'rewrite'      => ['slug' => 'riddim'],
        'has_archive'  => true,
        'public'       => true,
        'show_in_rest' => true,
        'menu_position'=> 5,
        'menu_icon'    => 'dashicons-album',
        'labels' => [
            'name'          => 'Riddim',
            'add_new_item'  => 'Ajouter un nouvel riddim',
            'edit_item'     => 'Éditer un riddim',
            'all_items'     => 'Tous les riddims',
            'singular_name' => 'Riddim'
        ]
    ]);

    // Banner Post Type
    register_post_type('banner', [
        'supports'     => ['title', 'editor', 'thumbnail', 'revisions', 'custom-fields'],
        'rewrite'      => ['slug' => 'banner'],
        'menu_position'=> 6,
        'public'       => true,
        'show_in_rest' => true,
        'menu_icon'    => 'dashicons-format-image',
        'labels' => [
            'name'          => 'Banner',
            'add_new_item'  => 'Ajouter un nouvel banner',
            'edit_item'     => 'Éditer un banner',
            'all_items'     => 'Toutes les banners',
            'singular_name' => 'banner'
        ]
    ]);

    // Banner Music Post Type
    register_post_type('banner-music', [
        'supports'     => ['title', 'editor', 'thumbnail', 'revisions', 'custom-fields'],
        'rewrite'      => ['slug' => 'banner-music'],
        'menu_position'=> 6,
        'public'       => true,
        'show_in_rest' => true,
        'menu_icon'    => 'dashicons-money',
        'labels' => [
            'name'          => 'Banner Music',
            'add_new_item'  => 'Ajouter un nouvel banner',
            'edit_item'     => 'Éditer un banner',
            'all_items'     => 'Toutes les banners',
            'singular_name' => 'banner'
        ]
    ]);    
}

add_action('init', 'pepsee_post_types');