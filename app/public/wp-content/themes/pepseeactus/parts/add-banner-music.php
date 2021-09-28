<?php
$args = [
    'posts_per_page' => 1,
    'orderby' => 'date',
    'post_type' => 'banner-music'
];

$query = new WP_Query($args);
if ( $query->have_posts() ) :
    while ( $query->have_posts() ) :
        $query->the_post();
        $artiste = get_field('artistes_associes');
        $musique = get_field('musiques_associees');
        $thumb_id = get_post_thumbnail_id();
        $thumb_url = wp_get_attachment_image_src($thumb_id,'thumbnail-size', true);

        if ( $artiste ) :
            foreach( $artiste as $post ): 

                // Setup this post for WP functions (variable must be named $post).
                setup_postdata($post); ?>

                    <div class="add-artist">
                        <div class="artist-image"><?php the_post_thumbnail('thumbnail'); ?></div>
                        <div class="artist-info">
                            <p>Dernière sortie de</p>
                            <a href="<?php the_permalink(); ?>" class="artist-name"><?php the_title(); ?></a>
                        </div>
                    </div>

                <?php // Reset the global post object so that the rest of the page works correctly.
                wp_reset_postdata();
            endforeach;
        endif;
        if ( $musique ) :
            foreach( $musique as $post ): 

                // Setup this post for WP functions (variable must be named $post).
                setup_postdata($post); 
                $artiste = get_field('artistes');
                $titre = get_field('titre');
                ?>

                <div class="add-song" style="background-image:url('<?= $thumb_url[0]; ?>')">
                    <div class="song-image"><?php the_post_thumbnail('thumbnail'); ?></div>
                    <div class="song-info">
                        <a href="<?php the_permalink(); ?>" class="song-name"><?= $titre; ?></a>
                        <p class="song-artist"><?= $artiste; ?></p>
                    </div>
                </div>

                <?php // Reset the global post object so that the rest of the page works correctly.
                wp_reset_postdata();
            endforeach;
        endif;
    endwhile;
endif;
?>