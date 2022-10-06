FROM debian:buster

RUN apt-get -y update && apt-get -y install curl && apt-get -y install mariadb-client && apt-get -y install php7.3-fpm php7.3-common php7.3-mysql

COPY wp.sh /tmp/
COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && cp wp-cli.phar /usr/bin/wp && mkdir -p /var/run/php/

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["bash", "/tmp/wp.sh"]

CMD ["php-fpm7.3", "-F", "-R"]

