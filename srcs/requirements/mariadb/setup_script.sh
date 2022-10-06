#!/bin/sh
if [ ! -d /var/lib/mysql/wordpress ]; then
	mysqld&
	until mysqladmin ping; do
		echo "coucou"
		sleep 2
	done
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
	mysql -u root -e "GRANT USAGE ON wordpress.* TO '${ADMIN}'@'%' IDENTIFIED BY ${ADMIN_PASSWORD};"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SUPER_PWD};'"
	echo "Database created!"
	killall mysqld
else
	echo "The database already exist!"
fi

exec "$@"
