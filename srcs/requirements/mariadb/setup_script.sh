#!/bin/sh
if [ ! -d /var/lib/mysql/wordpress ]; then
	mysqld&
	until mysqladmin ping; do
		echo "coucou"
		sleep 2
	done
	mysql -u root "CREATE DATABASE IF NOT EXISTS wordpress;"
	mysql -u root "CREATE USER IF NOT EXISTS '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
	mysql -u root "GRANT USAGE ON wordpress.* TO '${ADMIN}'@'%' WITH GRANT OPTION;"
	mysql -u root "FLUSH PRIVILEGES;"
	mysql -u root "ALTER USER 'root'@'localhost' IDENTIFIED BY '${UPER_PWD}'"
	echo "Database created!"
	killall mysqld
else
	echo "The database already exist!"
fi

exec "$@"
