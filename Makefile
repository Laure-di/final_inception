NAME = inception

WP_VOL = /home/lmasson/data/wordpress/

DB_VOL = /home/lmasson/data/mariadb/

all:
	cat /etc/hosts | if ! grep -P "127.0.0.1\tlmasson.42.fr"; then sudo sh -c 'echo "127.0.0.1\tlmasson.42.fr" >> /etc/hosts'; fi
	sudo mkdir -p $(WP_VOL)
	sudo mkdir -p $(DB_VOL)
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up 2>1 > error.log
up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -a;

fclean: clean
		sudo rm -rf $(WP_VOL)
		sudo rm -rf $(DB_VOL)
