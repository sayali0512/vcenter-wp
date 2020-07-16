function create_wpconfig {
    local dbIP=$1
    local applicationDbName=$2
    local dbadminloginazure=$3
    local dbadminpass=$4
    local siteFQDN=$5

    cat <<EOF >/azlamp/html/$siteFQDN/wp-config.php
  <?php
  /**
  * Following configration file will be updated in the wordpress folder in runtime 
  *
  * Following configurations: Azure Database for MySQL server settings, Table Prefix,
  * Secret Keys, WordPress Language, and ABSPATH. 
  * 
  * wp-config.php  file is used during the installation.
  * Copy the wp-config file to wordpress folder.
  *
  */
  // ** Azure Database for MySQL server settings - You can get the following details from Azure Portal** //
  /** Database name for WordPress */
  define('DB_NAME', '$applicationDbName');
  /** username for MySQL database */
  define('DB_USER', '$dbadminloginazure');
  /** password for MySQL database */
  define('DB_PASSWORD', '$dbadminpass');
  /** Azure Database for MySQL server hostname */
  define('DB_HOST', '$dbIP');
  /** Database Charset to use in creating database tables. */
  define('DB_CHARSET', 'utf8');
  /** The Database Collate type. Don't change this if in doubt. */
  define('DB_COLLATE', '');
  /**
  * Authentication Unique Keys and Salts.
  * You can generate unique keys and salts at https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service
  * You can change these at any point in time to invalidate all existing cookies.
  */
  define('AUTH_KEY',         'h|Eu6ge.=Ej?fyV]/sHw:Ur~>(tkhZH(S^I[DHjE+OD}^MsG\`j0a/y8.n]@L8P{o');
  define('SECURE_AUTH_KEY',  '\`D2d-b,i1YmFQqOy/^]#p_G^fSXWyPm]e:)}H~BVIG\`>vG\$AnnYqUj^#*pPB;*,j');
  define('LOGGED_IN_KEY',    'Wqfh/&|XT| \$o0xeb+%Xf|_N;9Dpp19nzlB& b4w0I.D1;q<|-{4ajT\$JT(QF<@6');
  define('NONCE_KEY',        '89mwVzZXf2-[qjN+k-]#lbg8+>gxO%Fso9;-ptiUwqFS_4x-u\$6I<d,~v=mF2__|');
  define('AUTH_SALT',        't#ry@FfhD3,Y(lZf7+*V,&5rs(&\$xP,tz6[*<_&&CJW/]?2![NEQhsIi2vm-NYlZ');
  define('SECURE_AUTH_SALT', '9zIjp#dKMLLi{&Ag[Ig0Q]oP[[jN qNz<_Z= Gx#Ig/mi>k-J(oE6Prr&L[zR5Vp');
  define('LOGGED_IN_SALT',   '+(B*,@@5eH<?Mq7t-04>b>F%~C!6,+g?vf:w8N(Ne+nwA85N^U54#LHhssf1=>ap');
  define('NONCE_SALT',       'drEw_Z[MD z7Jv,t;WuR8&Q #z? D0c8RR!v*~mkSW1-PlXa9Bl>5&b|=Xe{z9a^');
  /**
  * WordPress Database Table prefix.
  *
  * You can have multiple installations in one database if you give each a unique prefix.
  * Only numbers, letters, and underscores are allowed.
  */
  \$table_prefix  = 'wp_';
  /**
  * WordPress Localized Language, defaults language is English.
  *
  * A corresponding MO file for the chosen language must be installed to wp-content/languages. 
  */
  define('WPLANG', '');
  /**
  * For developers: Debugging mode for WordPress.
  * Change WP_DEBUG to true to enable the display of notices during development.
  * It is strongly recommended that plugin and theme developers use WP_DEBUG in their development environments.
  */
  define('WP_DEBUG', false);
  /** Disable Automatic Updates Completely */
  define( 'AUTOMATIC_UPDATER_DISABLED', True );
  /** Define AUTOMATIC Updates for Components. */
  define( 'WP_AUTO_UPDATE_CORE', True );
  /** Absolute path to the WordPress directory. */
  if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
  /** Sets up WordPress vars and included files. */
  require_once(ABSPATH . 'wp-settings.php');
  /** Avoid FTP credentails. */
  define('FS_METHOD','direct');
EOF
}
