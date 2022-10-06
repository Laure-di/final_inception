#!/bin/sh
if [ ! -d /var/lib/mysql/wordpress ]; then
	mysqld&
	until mysqladmin ping; do
		echo "coucou"
		sleep 2
	done
	echo "create database if not exists wordpress;" | mysql -u root
	echo "CREATE USER IF NOT EXISTS '$ADMIN'@'%' IDENTIFIED BY '$ADMIN_PASSWORD';" | mysql -u root
	echo "GRANT USAGE ON wordpress.* TO '$ADMIN'@'%' IDENTIFIED BY '$ADMIN_PASSWORD';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SUPER_PWD';"| mysql -u root 
	echo "Database created!"
	killall mysqld
else
	echo "The database already exist!"
fi

exec "$@"
