#!/bin/bash

IMAGE_NAME="hands-on-ml"
IMAGE_TAG="latest"
IMAGE_PATH="."

# Check if the container name is provided as an argument
if [ -z "$1" ]; then
    echo "Error: No container name provided."
    echo "Usage: $0 <container-name>"
    exit 1
fi

CONTAINER_NAME=$1

# Check if image already exists
if [ "$(sudo docker images -q ${IMAGE_NAME}:${IMAGE_TAG})" ]; then

    echo "Image ${IMAGE_NAME}:${IMAGE_TAG} already exists."

else

    sudo docker build -t ${IMAGE_NAME} ${IMAGE_PATH}

fi


# Check if container already exists
if [ "$(sudo docker ps -aq -f name=${CONTAINER_NAME})" ]; then

    echo "Container ${IMAGE_NAME}:${IMAGE_TAG} already exists."

    sudo docker container start ${CONTAINER_NAME}

else

    sudo docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}

fi
