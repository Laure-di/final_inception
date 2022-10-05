#!/bin/sh

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
mysqld
#service mysql start
#mysql_secure_installation<<EOF
#
#y
#secret
#secret
#y
#y
#y
#y
#EOF
until mysqladmin ping;do
sleep 2
done
mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -e "CREATE USER '${MYSQL_ADMIN}'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN}'@'localhost';"
mysql -u root -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; GRANT ALL ON wp_wordpress.* TO '${MYSQL_USER}'@'localhost'"
mysql -e "DELETE FROM mysql.user WHERE user=''"
mysql -e "DELETE FROM mysql.user WHERE user='root'"
mysql -e "FLUSH PRIVILEGES;"
echo "Database created!"
killall mysqld
else
echo "The database already exist!"
fi

exec mysqld
