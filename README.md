# inception

## Installation d'une VM debian 

https://www.numetopia.fr/comment-installer-debian-dans-virtualbox/#configurer_la_machine_virtuelle_debian_dans_virtualbox
https://www.youtube.com/watch?v=Mok2J__Ci3Y

### Gestion user VM
1. Ajouter lmasson.42.fr dans le fichier /etc/hostnamme
2. Creer un user login : sudo adduser login
3. Ajouter les groupes sudo, docker : sudo usermod -aG sudo login

Pour bien démarrer le projet, quand on ne connait pas du tout docker, il est nécessaire de commencer par un tutoriel plusieurs options :

## Ressources pour démarrer : 

Un super support pour commencer à découvrir l'univers de Docker avec une plateforme d'exercices intégrée :
https://kodekloud.com/courses/docker-for-the-absolute-beginner/

Le site officiel de docker :
https://docs.docker.com

## Découper le projet et comprendre la structure

La lecture du sujet nous apprend beaucoup sur la structure que doit avoir notre projet. On peut grâce a cela commencer à écrire notre docker-compose.yalm

## Dockerfile

Ce fichier contient toutes les informations pour l'installation de ce que l'on souhaite (serveur, base de donnée, service de gestion d'emails, etc.) dans notre container. Il a une structure bien précise qui doit être respectée. 

## SSL : certicat et protocole
pour assurer une connexion sécurisé avec une encryptation de type x509. principe de l'encryptation asymétrique, qu'on certifie pour passer sur une encryptation synétrique. 

## docker-compose.ylm

Declarer volume : https://stackoverflow.com/questions/35841241/docker-compose-named-mounted-volume

https://docs.docker.com/storage/volumes/

## Mariadb
Creation user and modification 50-server.cnf
https://www.linuxtricks.fr/wiki/print.php?id=559


Openssl : generate a CSR (Certificate Signing Request)

Some interesting resources : 
https://installati.one/debian/10/openssl/
https://manpages.ubuntu.com/manpages/trusty/en/man8/apt-get.8.html
https://fr.wikipedia.org/wiki/OpenSSL
https://www.thesslstore.com/knowledgebase/ssl-generate/csr-generation-guide-for-nginx-openssl
https://www.openssl.org/docs/man1.0.2/man1/openssl-req.html
https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.html
https://medium.com/@munteanu210/how-to-install-an-ssl-certificate-on-nginx-b1dd39a4628d
https://www.geeksforgeeks.org/practical-uses-of-openssl-command-in-linux/

## NGINX

https://ubuntu.com/tutorials/install-and-configure-nginx#2-installing-nginx
https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/

GESTION DES LOG
https://docs.docker.com/config/containers/logging/

SSL CONFIGURATION NGINX.CONF
https://medium.com/@mvuksano/how-to-properly-configure-your-nginx-for-tls-564651438fe0

https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a

## Probleme de compilation

sudo chown $USER /var/run/docker.sock

