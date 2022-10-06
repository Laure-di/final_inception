if [ ! -d /var/lib/mysql/wordpress ]; then #if wordpress dir doesnt exist, then :
	mysqld&
	until mysqladmin ping; do  #https://stackoverflow.com/questions/29145370/how-can-i-initialize-a-mysql-database-with-schema-in-a-docker-container
		sleep 1
	done
	echo "create database if not exists wordpress;" | mysql -u root #initiates mysql connection with username root
	echo "create user if not exists '$ADMIN' identified by '$ADMIN_PASSWORD';" | mysql -u root
	echo "grant usage on wordpress.* TO '$ADMIN'@'%' identified by '$ADMIN_PASSWORD';" | mysql -u root
	echo "grant all privileges on wordpress.* TO '$ADMIN'@'%' identified by '$ADMIN_PASSWORD';" | mysql -u root
	echo "flush privileges;" | mysql -u root #reloads the grant tables in the mysql database enabling the changes to take effect without reloading or restarting mysql service + https://dev.mysql.com/doc/refman/5.7/en/grant-tables.html
	echo "alter user 'root'@'localhost' identified by '$SUPER_PWD';" | mysql -u root #https://dev.mysql.com/doc/refman/5.7/en/resetting-permissions.html at " Resetting the Root Password: Unix and Unix-Like Systems"
	killall mysqld #stops mysql
fi

exec "$@"
