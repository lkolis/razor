# Command: docker build
docker build -t fs_docker .

# Command: docker run 
docker run -p 8022:22 -p 8080:80 -d fs_docker

# Command: docker build
# Command: docker ps 	List all running containers
# Command: docker stop 	 Stop a running container.
# Command: docker start > Start a stopped container.
# Command: docker restart 	Restart a running container.
# Command: docker rm 	Remove a container.
# Command: docker rmi 	Remove a Docker image.
# Command: docker logs

