#!/bin/sh
	wp core download --allow-root
	wp config create --dbname=wordpress --dbuser=${ADMIN} --dbpass=${ADMIN_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${URL}/wordpress --title="${TITLE}" --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL} --skip-email --allow-root
	wp user create ${USER_WP} ${USER_EMAIL_WP} --role=author --user_pass=${USER_WP_PASS} --allow-root
exec "$@"
