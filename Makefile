COMPOSE_FILE = srcs/docker-compose.yml

all:
	sudo docker-compose --verbose -f $(COMPOSE_FILE) up -d --build --remove-orphans

clean:
	sudo docker-compose -f $(COMPOSE_FILE) down -t 2

fclean: $(CLEAN)
	sudo docker system prune -a -f
