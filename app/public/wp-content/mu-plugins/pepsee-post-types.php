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
}


function pepsee_register_genre_taxonomy() {

    register_taxonomy('genre', ['artist', 'beatmaker', 'music', 'album', 'riddim'], [
        'hierarchical'      => true,
        'labels'            => [
            'name'              => 'Genres musicaux',
            'singular_name'     => 'Genre musical',
            'search_items'      => 'Rechercher un genre',
            'all_items'         => 'Tous les genres',
            'parent_item'       => 'Genre parent',
            'parent_item_colon' => 'Genre parent :',
            'edit_item'         => 'Éditer le genre',
            'update_item'       => 'Mettre à jour le genre',
            'add_new_item'      => 'Ajouter un nouveau genre',
            'new_item_name'     => 'Nom du nouveau genre',
            'menu_name'         => 'Genres musicaux',
        ],
        'show_ui'           => true,
        'show_admin_column' => true,
        'show_in_rest'      => true,
        'rewrite'           => [
            'slug'         => 'genre',
            'hierarchical' => true
        ],
    ]);
}

add_action('init', 'pepsee_post_types');
add_action('init', 'pepsee_register_genre_taxonomy');