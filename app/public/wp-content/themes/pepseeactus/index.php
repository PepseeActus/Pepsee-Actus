<?php get_header(); ?>
<?php while (have_posts()) {
    the_post(); ?>
    <div class="post-item">
        <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
        <div class="metabox">
            <p>Posté par <?php the_author_posts_link(); ?> le <?php the_date(); ?> dans la section <?= get_the_category_list(', '); ?></p>
        </div>
        <div class="generic-content">
            <?php the_excerpt(); ?>
            <p><a href="<?php the_permalink(); ?>">Continuer à lire</a></p>
        </div>
    </div>
<?php } ?>
<?= paginate_links(); ?>
<?php get_footer(); ?>