#!/bin/sh
if [ -f /var/www/html/wp-config.php ]; then
echo "wp already here"
else
 	cd /var/www/html/
	wp core download --allow-root
	wp config create --dbname=${MYSQL_DB} --dbuser=${MYSQL_ADMIN} --dbpass=${MYSQL_ADMIN_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${URL} --title="${TITLE}" --admin_user=${ADMIN_WP} --admin_password=${ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL} --skip-email --allow-root
	wp user create ${USER_WP} ${USER_MAIL_WP} --role=author --user_pass=${USER_WP_PASS} --allow-root
	wp theme install "teluro" --activate --allow-root
fi

exec "$@"
