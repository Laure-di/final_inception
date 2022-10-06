FROM debian:buster

RUN apt-get update

RUN apt-get install -y php-fpm php-mysql php-common curl mariadb-client

FROM debian:buster

RUN apt-get -y update && apt-get -y install wget && apt-get -y install mariadb-client && apt-get -y install php7.3-fpm php7.3-common php7.3-mysql

COPY wp.sh /tmp/
COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && cp wp-cli.phar /usr/bin/wp && mkdir -p /var/run/php/

WORKDIR /var/www/html/wordpress
#The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.
#https://docs.docker.com/engine/reference/builder/#workdir

ENTRYPOINT ["bash", "/tmp/wp.sh"]

CMD ["php-fpm7.3", "-F", "-R"]

