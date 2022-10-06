FROM debian:buster

RUN apt-get update

RUN apt-get install -y php7.3-fpm php7.3-mysql php-common curl mariadb-client

RUN mkdir -p /run/php/

RUN sed -i "s+listen = /run/php/php7.3-fpm.sock+listen = 9000+g" /etc/php/7.3/fpm/pool.d/www.conf

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY wp.sh /root/wp.sh

RUN chmod +x /root/wp.sh

RUN ln -sf /dev/stdout /var/log/php7.3-fpm.access.log

RUN	 ln -sf /dev/stderr /var/log/php7.3-fpm.log

WORKDIR		/var/www/html/wordpress

ENTRYPOINT	["bash", "/root/wp.sh"]

CMD	["php-fpm7.3 ", "-F"]

