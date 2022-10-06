FROM debian:buster

RUN apt-get update

RUN apt-get install -y php-fpm php-mysql php-common curl mariadb-client

RUN mkdir -p /run/php/

COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

COPY  wp-cli.phar /usr/bin/wp

COPY wp.sh /root/wp.sh

RUN chmod +x /root/wp.sh

#RUN ln -sf /dev/stdout /var/log/php7.3-fpm.access.log

#RUN	 ln -sf /dev/stderr /var/log/php7.3-fpm.log

WORKDIR		/var/www/html/wordpress

ENTRYPOINT	["bash", "/root/wp.sh"]

CMD	["php-fpm", "-F", "-R"]

