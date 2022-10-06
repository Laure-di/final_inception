#!/bin/sh
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	wp core download --allow-root
	until mysqladmin -hmariadb -u${ADMIN} -p${ADMIN_PASSWORD} ping; do
        sleep 2
    done
	wp config create --dbname=wordpress --dbuser=${ADMIN} --dbpass=${ADMIN_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL} --skip-email --allow-root
	wp user create ${USER_WP} ${USER_EMAIL_WP} --role=author --user_pass=${USER_WP_PASS} --allow-root
	wp theme install "teluro" --activate --allow-root
else
		echo "wp already exist"
fi
exec "$@"
