#!/bin/bash

# check work folder
[ ! -d "work" ] && mkdir work

# declare container name
CONTAINER_NAME="gpu-jupyter-docker"

# check container running
if [ "$(docker ps -aq -f status=running -f name=$CONTAINER_NAME)" ]; then
    echo "Container is already running : $CONTAINER_NAME"
    exit 0
elif [ "$(docker ps -q -f status=exited -f name=$CONTAINER_NAME)" ]; then
    echo "Exited container found : $CONTAINER_NAME"
    echo "Removing container..."
    docker rm $CONTAINER_NAME
fi

# run container
docker run --name $CONTAINER_NAME --shm-size=4G --gpus all -d -it -p 8848:8888 -v $(pwd)/work:/home/jovyan/work -e GRANT_SUDO=yes -e JUPYTER_ENABLE_LAB=yes --user root cschranz/gpu-jupyter:v1.7_cuda-12.2_ubuntu-22.04

