COMPOSE = srcs/docker-compose.yml
CLEAN = srcs/requirements/clean.sh

all : up

up :
	@ mkdir -p /home/atourret/data/mariadb_data
	@ mkdir -p /home/atourret/data/wp_data
	@ docker-compose -f $(COMPOSE) up -d --build

# stop services
stop :
	@ docker-compose -f $(COMPOSE) stop

# stop service and remove containers, networks
down :
	@ docker-compose -f $(COMPOSE) down

# rm images, containers, volumes
clean :
	@ bash $(CLEAN)

# remove all unused containers, networks, images
prune :
	@ docker system prune

# show containers
ps :
	@ docker-compose -f $(COMPOSE) ps
