FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN apt-get -y install procps


# -y means "assume "yes" as answer to all prompts.
#https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl

COPY conf/nginx.conf /etc/nginx/sites-enabled/
#https://wiki.debian.org/Nginx/DirectoryStructure#A.2Fetc.2Fnginx.2F

RUN mkdir /etc/nginx/ssl 
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/local.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=cjullien"
RUN mkdir -p /var/www/html/wordpress

CMD ["nginx", "-g", "daemon off;"]
#If you add a custom CMD in the Dockerfile, be sure to include -g daemon off; in the CMD in order for nginx to stay in the foreground, so that Docker can track the process properly (otherwise your container will stop immediately after starting)!
