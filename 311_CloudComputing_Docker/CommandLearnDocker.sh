

# my stared marked img   https://hub.docker.com/u/ankit127iitp/starred


docker ps
# For all containers (including stopped ones):
docker ps -a
docker images
docker info


# run the IMAGE (while extract from img to container) interactive made, matlab hm access karenege Terminal ko bhi container ka bhai es liye
docker run -it IMAGE_NAME



# chek the size of pulled container
docker system df
docker image ls
docker ps -a --size
docker system df -v

# Unused containers, networks, volumes, images delete and  Agar cleanup karna ho (space free)
docker system prune
docker system prune -a --volumes


# Assign the custom Container NAME while exporting
docker run --name <your_custom_name> <image_name>
docker run -it --name kittu_ubuntu ubuntu:rolling    # yaha rolling ek tag hai ho version ke tarh kam kar raha hai ok Ankit Bhai


# detach and attach mode to run container
sanja@IITP:~$ docker run -d -e MYSQL_ROOT_PASSWORD=my-secret mysql
docker run -d -e MYSQL_ROOT_PASSWORD=my-secret --name kittuDetachSQL mysql:8.4.6



