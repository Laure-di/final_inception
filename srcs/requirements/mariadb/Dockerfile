FROM	debian:buster

RUN		apt-get update

RUN		apt-get -y install mariadb-server mariadb-client

RUN		mkdir -p /var/run/mysqld && chown -R mysql:root /var/run/mysqld

RUN		mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld

RUN		chmod 777 /var/run/mysqld

RUN sed -i "s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


#RUN sed -i "s/#port                   = 3306/port                   = 3306/g" /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed -i "s+socket = /var/run/mysqld/mysqld.sock+socket = run/mysqld/mysqld.sock+g"  /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed -i "s+pid-file = /var/run/mysqld/mysqld.pid+pid-file = /run/mysqld/mysqld.pid+g" /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./setup_script.sh /root/setup_script.sh

RUN	chmod +x /root/setup_script.sh

ENTRYPOINT ["/root/setup_script.sh"]

CMD		["mysqld_safe", "--datadir='/var/lib/mysql"]


