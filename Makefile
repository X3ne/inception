NAME		= inception

COMPOSE	= docker-compose -f srcs/docker-compose.yml -p $(NAME)

# Rules
all: build up

build: create_volume
	@$(COMPOSE) build

create_volume:
	@mkdir -p /home/$(USER)/data/WordPress
	@mkdir -p /home/$(USER)/data/DB

up:
	@$(COMPOSE) up -d

down:
	@$(COMPOSE) down

clean:
	@$(COMPOSE) down --rmi all -v

fclean: clean
	sudo rm -rf /home/$(USER)/data/*

re: fclean all
