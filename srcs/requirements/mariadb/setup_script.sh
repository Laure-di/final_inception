#!/bin/sh
mysql_install_db
if [ ! -d /var/lib/mysql/wordpress ] then
	mysqld&
	until mysqladmin ping;do
		sleep 2
	done
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
	mysql -u root -e "GRANT USAGE ON wordpress.* TO '${ADMIN}'@'%' WITH GRANT OPTION;"
	mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${SUPER_PWD}')"
	mysql -e "FLUSH PRIVILEGES;"
	echo "Database created!"
	killall mysqld
else
	echo "The database already exist!"
fi

exec "$@"
