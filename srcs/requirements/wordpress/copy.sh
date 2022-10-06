if [ ! -f /var/www/html/wp-config.php ]; then
	echo "First run"
	cd /var/www/html
	wp core download --allow-root # Download wordpress
	until mysqladmin -hmariadb -u${DB_USER} -p${DB_USERPSWRD} ping; do
		sleep 2
	done
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USERPSWRD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root # Configure the DB
	wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root #Configure website & admin
	wp user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
	wp theme install ${WP_THEME} --activate --allow-root
	echo "End first run"
	else
		echo "wordpress already created"
fi
