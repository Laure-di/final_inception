FROM	debian:buster

RUN		apt-get update

RUN		apt-get -y install nginx

RUN		apt-get -y install openssl

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=FR/ST=IDF/L=Paris/O=42School/CN=lmasson/"

RUN mkdir -p /var/www/html/wordpress

RUN ln -sf /dev/stdout /var/log/nginx/access.log

RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
