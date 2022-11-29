
# Delete all images
#docker rmi -f $(docker images -a -q)

#docker container prune

#docker image prune

#docker volume prune

clear
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "This is a very dangerous step!"
echo "It is going to clean the docker system."
echo "Kill all running containers, removes them and removes the images, volumes and networks."
read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]).
        # Kill all running containers
		docker kill $(docker ps -q)

		# Remove all not used (previously killed as well) containers, images, volumes and networks
		docker system prune
        ;;
    *)
        echo "Nothing changed."
        ;;
esac
