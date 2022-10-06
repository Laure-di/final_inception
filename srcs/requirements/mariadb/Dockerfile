FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY setup.cnf /etc/mysql/mariadb.conf.d/

COPY setup_script.sh /tmp/

RUN mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld && chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["bash", "tmp/setup_script.sh"]

CMD ["mysqld"]

