FROM	debian:buster

RUN		apt-get update

RUN		apt-get -y install mariadb-server


RUN mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld && chown -R mysql:mysql /var/lib/mysql
#RUN		mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld

#RUN		chmod 777 /var/run/mysqld

#RUN sed -i "s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


#RUN sed -i "s/#port                   = 3306/port                   = 3306/g" /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed -i "s+socket = /var/run/mysqld/mysqld.sock+socket = run/mysqld/mysqld.sock+g"  /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed -i "s+pid-file = /var/run/mysqld/mysqld.pid+pid-file = /run/mysqld/mysqld.pid+g" /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed -i "s+socket                            /var/run/mysqld/mysqld.sock+socket						/run/mysqld/mysqld.sock+g" /etc/mysql/my.cnf

COPY setup.cnf /etc/mysqld/mariadb.conf.d

COPY ./setup_script.sh /root/setup_script.sh

RUN	chmod +x /root/setup_script.sh

ENTRYPOINT ["bash", "/root/setup_script.sh"]

CMD		["mysqld"]

#CMD		["bash", "/root/setup_script.sh"]


