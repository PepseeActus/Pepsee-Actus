<?php
$artistes = get_field('artistes');
$titre = get_field('titre');
?>
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <?php $weekAgo = strtotime('-1 week'); ?>
    <a href="<?php the_permalink(); ?>">
        <?php the_post_thumbnail('thumbnail'); ?>
    </a>
    <div class="info">
        <div class="title">
            <a href="<?php the_permalink(); ?>"><?= $artistes; ?></a>
            <?php if ( intval(strtotime($post->post_modified)) > intval($weekAgo) ) : ?>
            <span class="new"><svg class="widget__icon" width="39.45" height="49.68" viewBox="0 0 39.45 49.68">
                    <path
                        d="M26.46 10.38c.5 1.07 5.53 11.36 1.22 10.54C23.38 20.1 17 7.56 17.8 0c0 0-8.14 6.08-6.64 15.02 1.5 8.94 3.63 15.54-2 15.32-5.66-.22-2.44-7.1-1.26-10.4-9.42 5.57-8 14.9-7.55 18 .38 2.57 1.57 8.57 8 11 9.8 2.15 13.64-14.08 13.3-19.52 2.67 3.15 4.4 7.57 4.05 10.5-.7 5.7-5.5 10.22-.9 9.72 6.95-.76 12.07-4.12 13.98-12.7 2.08-9.36-.3-20.86-12.32-26.56">
                    </path>
                </svg> NEW</span>
            <?php endif; ?>
        </div>
        <p>
            <a href="<?php the_permalink(); ?>">
            <?= $titre; ?>                                   
            <div>
                <?php if ( get_the_time( 'Y' ) < '2015' ) {
                    the_date('Y');
                } else {
                    the_date('F Y');
                } ?>
            </div>
            </a>
        </p>
        <?php get_template_part( 'parts/link-template' ); ?>
    </div>
</article>
