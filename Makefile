all : upd

build : 
	@docker-compose -f ./srcs/docker-compose.yml build

up : 
	@docker-compose -f ./srcs/docker-compose.yml up

upd : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

downv : 
	@docker-compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps