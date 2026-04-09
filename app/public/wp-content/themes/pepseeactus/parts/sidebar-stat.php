<section class="widget">
    <h3 class="widget-title">Stats 2026</h3>
    <div>
        <?php
            $year = '2026'; // L'année pour laquelle vous voulez compter les musiques

            // Récupérer tous les artistes
            $artists = get_posts(array(
                'post_type' => 'artist',
                'posts_per_page' => -1
            ));

            // Initialiser un tableau pour stocker les artistes et leur nombre de musiques
            $artists_count = array();

            // Boucler sur chaque artiste
            foreach($artists as $artist) {
                // Récupérer les musiques reliées à l'artiste
                $musics = get_field('musique_associees', $artist->ID);

                // Initialiser un compteur pour les musiques sorties sur l'année donnée
                $music_count = 0;

                // Boucler sur chaque musique reliée à l'artiste
                if($musics){
                    foreach($musics as $music) {
                        if(get_the_time( 'Y', $music->ID ) == $year) {
                            // Incrémenter le compteur si la date de sortie correspond à l'année donnée
                            $music_count++;
                        }
                    }
                }
                // Ajouter l'artiste et son nombre de musiques à notre tableau
                $artists_count[$artist->ID] = $music_count;
            }

            // Trier les artistes par ordre décroissant de nombre de musiques
            arsort($artists_count);
            $rank = 1;

            // Afficher les 10 premiers artistes de notre tableau
            $i = 0;
            foreach($artists_count as $artist_id => $music_count) {
                if($i < 10) {
                    echo '<p>' . $rank . ' . <b><a href="' . get_the_permalink($artist_id) . '">' . get_the_title($artist_id) . '</a></b> - ' . $music_count . ' singles</p>';
                    $rank++;
                }
                $i++;
            }
        ?>
    </div>
</section>
