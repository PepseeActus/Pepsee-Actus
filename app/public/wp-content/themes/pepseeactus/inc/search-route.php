<?php

function pepseeactusRegisterSearch() {
    register_rest_route('pepsee/v1', 'search', [
        'methods' => WP_REST_SERVER::READABLE,
        'callback' => 'pepseeSearchResults'
    ]);
}

function pepseeSearchResults($data) {
    $mainQuery = new WP_Query([
        'post_type' => ['post', 'artist', 'music', 'album'],
        's' => sanitize_text_field($data['term'])
    ]);

    $results = [
        'generalInfo' => [],
        'artist' => [],
        'music' => [],
        'album' => []
    ];

    while($mainQuery->have_posts()) {
        $mainQuery->the_post();

        if (get_post_type() == 'post') {
            array_push($results['generalInfo'], [
                'title' => get_the_title(),
                'permalink' => get_the_permalink()
            ]);
        }

        if (get_post_type() == 'artist') {
            array_push($results['artist'], [
                'title' => get_the_title(),
                'permalink' => get_the_permalink(),
                'image' => get_the_post_thumbnail_url(0, 'thumbnail')
            ]);
        }

        if (get_post_type() == 'music') {
            array_push($results['music'], [
                'title' => get_the_title(),
                'permalink' => get_the_permalink()
            ]);
        }

        if (get_post_type() == 'album') {
            array_push($results['album'], [
                'title' => get_the_title(),
                'permalink' => get_the_permalink()
            ]);
        }
    }

    return $results;
}

add_action('rest_api_init', 'pepseeactusRegisterSearch');