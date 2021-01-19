<?php 
    $download = get_field('download');

if ($download) :
?>
    <div class="download">
        <p>For promotional use only</p>
        <a href="<?php $download ?>" target="_blank">Télécharger</a>
    </div>
<?php endif; ?>
