#########################################################
# imports
#########################################################

include .env
DATABASE_ROOT_PASS := ${DATABASE_ROOT_PASS}

#########################################################
# variables
#########################################################

COMPOSE := docker-compose
BUILD := $(COMPOSE) build --no-cache
UP := $(COMPOSE) up -d
DOWN := $(COMPOSE) down
EXEC = $(COMPOSE) exec --user $(CONTAINER_USER_NAME) $(CONTAINER) bash $(ARG)
CONTAINER =
ARG =

# docker services (container name)
DB := db

#########################################################
# make commands
#########################################################

init:
	@make create-docker-env build up

create-docker-env:
	@cp -n .env.example .env

build:
	@make create-encryption-key-file && $(BUILD)

up:
	@$(UP)

create-encryption-key-file:
	@sudo bash ./shell/create-encryption-key-file.sh

exec-db:
	$(eval CONTAINER := $(DB))
	@docker compose exec $(CONTAINER) bash

exec-mysql:
	$(eval CONTAINER := $(DB))
	$(eval ARG := -c "\
	mysql -u root -p$(DATABASE_ROOT_PASS)\
	")
	@docker compose exec $(CONTAINER) bash $(ARG)

down:
	@$(DOWN)

remove:
	@sudo rm -rf ./mariadb/encryption ./mariadb/data && $(DOWN) --rmi all --volumes --remove-orphans
