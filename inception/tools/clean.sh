docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker network rm $(docker network ls -q)
docker volume rm $(docker volume ls -q)
docker rmi $(docker images -q)
	
