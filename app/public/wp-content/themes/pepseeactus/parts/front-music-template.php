<?php
$artistes = get_field('artistes');
$titre = get_field('titre');
$riddim = get_field('riddim');
$download = get_field('download');
$weekAgo = strtotime('-1 week');
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <a class="rotate" href="<?php the_permalink(); ?>">
        <?php the_post_thumbnail('thumbnail'); ?>
    </a>
    <div class="info">
        <div class="title"><a href="<?php the_permalink(); ?>" target="_blank"><?= $artistes; ?></a></div>
        <p>
            <a href="<?php the_permalink(); ?>" target="_blank"><?= $titre; ?></a>
            <?php if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
                <span class="new"><svg class="widget__icon" width="39.45" height="49.68" viewBox="0 0 39.45 49.68">
                    <path
                        d="M26.46 10.38c.5 1.07 5.53 11.36 1.22 10.54C23.38 20.1 17 7.56 17.8 0c0 0-8.14 6.08-6.64 15.02 1.5 8.94 3.63 15.54-2 15.32-5.66-.22-2.44-7.1-1.26-10.4-9.42 5.57-8 14.9-7.55 18 .38 2.57 1.57 8.57 8 11 9.8 2.15 13.64-14.08 13.3-19.52 2.67 3.15 4.4 7.57 4.05 10.5-.7 5.7-5.5 10.22-.9 9.72 6.95-.76 12.07-4.12 13.98-12.7 2.08-9.36-.3-20.86-12.32-26.56">
                    </path>
                </svg> NEW</span>
            <?php endif; ?>
        </p>
        <?= ($riddim) ? '<p class="riddim">'.$riddim.' Riddim</p>' : ''; ?>
        <?= ($download) ? '<a href="'.get_the_permalink().'" target="_blank">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
                <path d="m363,373.1h-60.2v-140.1c0-5.8-4.7-10.4-10.4-10.4h-72.8c-5.8,0-10.4,4.7-10.4,10.4v140.1h-60.2c-12.6,0.8-12,14.5-7.4,17.8l107,107c2.1,2.2 8.6,5.7 14.7,0l107-107c5-4.6 4.8-16.9-7.3-17.8zm-107,102.7l-81.8-81.8h45.4c5.8,0 10.4-4.7 10.4-10.4v-140.2h51.9v140.1c0,5.8 4.7,10.4 10.4,10.4h45.5l-81.8,81.9z"/>
                <path d="m384.2,129.1c-5.4-66-60.8-118.1-128.2-118.1s-122.8,52.1-128.2,118.1c-1.42109e-14,0-105.6-4.2-105.6,99.8 0,53.6 44.8,99.8 99.8,99.8h67.7c5.8,0 10.4-4.7 10.4-10.4s-4.7-10.4-10.4-10.4h-67.7c-43.5,0-78.9-35.4-78.9-79 0-43.5 34.4-78.5 78.9-79 7.1-0.1 26.2,4.3 26.2-10.4 0-59.4 48.3-107.7 107.7-107.7 59.4,0 107.7,48.3 107.7,107.7 0,14.3 19.2,10.4 26.2,10.4 43.1,0.3 79,35.4 79,79 0,43.5-35.4,79-79,79h-67.7c-5.8,0-10.4,4.7-10.4,10.4s4.7,10.4 10.4,10.4h67.7c55,0 99.8-45.7 99.8-99.8 0.1-102.7-105.4-99.8-105.4-99.8z"/>
            </svg>
            Télécharger
        </a>' : ''; ?>
    </div>
</article>
