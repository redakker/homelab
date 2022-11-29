#!/bin/bash

# This script clean the docker system. Delete all images and containters (which are not used)
# It does not touch the config files in this directory

# Remember, you should remove all the containers before removing all the images from which those containers were created
# https://stackoverflow.com/questions/44785585/docker-how-to-delete-all-local-docker-images

# Delete all conatiners (force)
#docker rm -vf $(docker ps -a -q)

# Delete all images
#docker rmi -f $(docker images -a -q)

docker system prune
