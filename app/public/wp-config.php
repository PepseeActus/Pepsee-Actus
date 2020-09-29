<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
if (file_exists(dirname(__FILE__) . '/local.php')) {
    // local database settings
    define( 'DB_NAME', 'local' );
    define( 'DB_USER', 'root' );
    define( 'DB_PASSWORD', 'root' );
    define( 'DB_HOST', 'localhost' );
} else {
    //live database settings
    define( 'DB_NAME', 'chri4337_pepseeActusData' );
    define( 'DB_USER', 'chri4337_wp362' );
    define( 'DB_PASSWORD', '4hL1EHST@xb.' );
    define( 'DB_HOST', 'localhost' );
}

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'DwG6mbgUgOiwk+4Vo2Kl57P6VWmY5+M8tfeN5gcUeMBdKKYjaI5XKayr/XYucZhemJj2Q3ELnMQ3lrVEz8FPfw==');
define('SECURE_AUTH_KEY',  'x0O9KBW0+2h7M/aWzKt1dsfNb0YQ7b/NU+Si16TvZ+6R08HiVefdhdDRQPLXhOab5W0WOwwsUsZNuwK1LZ4Ifg==');
define('LOGGED_IN_KEY',    'm6ShpTguETrlysJIvT8SRWPWzwwIemeYBeIh131/xEXUcpQOXg6W7/hXjqDrCrgz4CQLmTnciQTGy3oh1fdLnQ==');
define('NONCE_KEY',        'a7LX+oXSn7tBdSM6h0FM0wQ5ZKw7nwJSNkrXR1XauAv0/BCMTkg+G1f+1VZM2SGU2bu67gmyKxhW1F76jgt1mA==');
define('AUTH_SALT',        'hDEMXIVJ27esedNHuwFM7WKXeUt9eZsI9N/G4QXJtECLqnD+DxwmWN3QlpphuDWFgw02WdT1Rat0FQ0gestSKg==');
define('SECURE_AUTH_SALT', 'xZkI9FqW5Myk0BsDaYYqCgvqaWf3ZsTG1CWJWmPLKmg919TmXQ/0Y0xq44iFHb+Weqn+DikilzqSubJbtyOYwQ==');
define('LOGGED_IN_SALT',   'weH6MoDtXdaRIBbnNS8TzPYucPVc/Vn+9CEvJFxi/fPGdYTjbJeRjXiGYa/kagMyHgoRZvg9z7uoWF+B5bswyA==');
define('NONCE_SALT',       'wxxYAc7LizHpw1/9sEAuOIhI1agJayqMp1mfB8CufmpzIc99bJ+JE2Dh8r3EAe42I3/H+w7ZW2W6a1obIECSpw==');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
//$table_prefix = 'wp_cs87mn_';
$table_prefix = 'wp_';

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
