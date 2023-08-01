# Variables
DOCKER_COMPOSE = sudo docker-compose -f srcs/docker-compose.yml
PROJECT_NAME = inception

# Commandes pour construire et lancer les conteneurs
all: build up

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) restart

logs:
	$(DOCKER_COMPOSE) logs -f

# Commandes supplémentaires pour gérer les conteneurs
stop:
	$(DOCKER_COMPOSE) stop

start:
	$(DOCKER_COMPOSE) start

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

# Autres commandes utiles
ps:
	$(DOCKER_COMPOSE) ps

exec-wordpress:
	$(DOCKER_COMPOSE) exec wordpress bash

exec-db:
	$(DOCKER_COMPOSE) exec db bash

