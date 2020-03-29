<?php
/**
 * File that contains all the logic regarding the handling of comments
 */

$gc_public_key = GcParamsService::getInstance()->graphcommentGetWebsite();

if (empty($gc_public_key)) {
  $pluginData = get_plugin_data(dirname(__FILE__) . '/graphcomment.php');
  $html_error = "<div class=\"gc-wp-error\">\n";
  $html_error .= "<!-- " . $pluginData['Version'] . " -->\n";
  $html_error .= "  <div class=\"gc-wp-error-inner\">\n";
  $html_error .= "    <strong>" . __('Error', 'graphcomment-comment-system') . ": </strong>";
  $html_error .= __('GraphComment couldn\'t be load because your settings are invalid.', 'graphcomment-comment-system') . ' ';
  $html_error .= __('Please visit your admin panel and go to the GraphComment section and enter a valid website URL/ID.', 'graphcomment-comment-system');
  $html_error .= "  </div>\n";
  $html_error .= "</div>\n";

  echo $html_error;
  return;
}

// sso

$ssoActivated = get_option('gc_sso_activated');
$user = wp_get_current_user();

if ($ssoActivated && $user->ID) {
  $data = array(
      'id' => $user->data->ID, // required unique
      'username' => $user->data->user_nicename, // required unique
      'email' => $user->data->user_email, // required unique
      'language' => substr(get_user_locale($user->data->ID), 0, 2), //(optionnal) default value : en (codes ISO 639-1)
      'picture' => get_avatar_url($user->data->ID) // (optionnal) full url only
  );

  $privateKey = get_option('gc_api_private_key');
  if ($privateKey) $ssoData = generateSsoData($data, $privateKey);
}

$overlayActivated = get_option('gc_overlay_activated');

// readonly

$readonlyActivated = get_option('gc_readonly_activated');
$readonlyWho = get_option('gc_readonly_who');
$readonlyRoles = get_option('gc_readonly_roles');

$user = wp_get_current_user();
$readonly = false;

if ($readonlyActivated) {
  if ($readonlyWho === 'all') {
    $readonly = true;
  }
  else if ($readonlyWho === 'specific') {
    if ($user) {
      $readonly = true;
      $roles = $user->roles;
      foreach($user->roles as $role) {
        if (in_array($role, $readonlyRoles)) {
          $readonly = false;
        }
      }
    } else {
      $readonly = true;
    }
  }
}

// fixed_header_height

$fixedHeaderHeight = 0;

if (get_option('gc_overlay_fixed_header_height')) {
  $fixedHeaderHeight = get_option('gc_overlay_fixed_header_height');
}
else if (is_admin_bar_showing()) {
  $fixedHeaderHeight = 'window.innerWidth <= 782 ? 46 : 32';
}

?>

<div id="comments"></div>
<div id="graphcomment"></div>
<!-- <?php $pluginData = get_plugin_data(dirname(__FILE__) . '/graphcomment.php'); echo $pluginData['Version']; ?> -->
<script type="text/javascript">
  /* * * CONFIGURATION VARIABLES: * * */
  window.gc_params = {
    page_title:       '<?php echo GcParamsService::getInstance()->graphcommentIdenfitierGetPostTitle(get_post()); ?>',
    identifier:       '<?php echo GcParamsService::getInstance()->graphcommentIdentifierGenerate(get_post()); ?>',
    graphcomment_id:  '<?php echo $gc_public_key; ?>',
    guid: '<?php echo GcParamsService::getInstance()->graphcommentGuid(get_post()); ?>',
    uid: '<?php echo GcParamsService::getInstance()->graphcommentUid(get_post()); ?>',
    readonly: <?php echo $readonly ? 'true' : 'false'; ?>,
    fixed_header_height: <?php echo $fixedHeaderHeight; ?>,
    <?php if ($overlayActivated) { ?>
    overlay: {
      visible: <?php echo get_option('gc_overlay_visible') ? 'true' : 'false'; ?>,
      width: <?php echo get_option('gc_overlay_width', '400'); ?>,
      button: {
        label: '<?php echo get_option('gc_overlay_button_label'); ?>',
        color: '<?php echo get_option('gc_overlay_button_color'); ?>',
        background: '<?php echo get_option('gc_overlay_button_background'); ?>',
      },
      bubble: <?php echo get_option('gc_overlay_bubble') ? 'true' : 'false'; ?>,
    },
    <?php } else { ?>
    overlay: false,
    <?php } ?>
    <?php if ($ssoActivated) { ?>
    sso_public_key: '<?php echo get_option("gc_api_public_key"); ?>',
    sso_data: '<?php echo isset($ssoData) ? $ssoData : ''; ?>',
    <?php } ?>
  };

  window.gcSsoAuth = function() {
    window.location.href = "<?php echo wp_login_url($_SERVER['REQUEST_URI']); ?>";
  };

  /* * * DON'T EDIT BELOW THIS LINE * * */
  (function () {
    var gc = document.createElement('script');
    gc.type = 'text/javascript';
    gc.async = true;
    gc.src = '<?php echo constant('GRAPHCOMMENT_URL'); ?>/js/integration.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(gc);
  })();
</script>
