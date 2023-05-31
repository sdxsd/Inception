<?php

/** My BASED wordpress config. with my sick and epic database entries. */

/** The name of the database for WordPress */
define( 'DB_NAME', 'lettercrunch' );

/** Database username */
define( 'DB_USER', 'USRNAME' );

/** Database password */
define( 'DB_PASSWORD', 'PASSWD' );

/** Database hostname */
define( 'DB_HOST', 'database' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'your_unique_phrase' );
define( 'SECURE_AUTH_KEY',  'supercoolphrase' );
define( 'LOGGED_IN_KEY',    'myphrase1993' );
define( 'NONCE_KEY',        'hellisaplaceonearth' );
define( 'AUTH_SALT',        'zonk.jpeg' );
define( 'SECURE_AUTH_SALT', 'gettin_zome_za_za' );
define( 'LOGGED_IN_SALT',   'eastereggnextphrase' );
define( 'NONCE_SALT',       'allmypasswordsare_jonkadingo9876543201' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
