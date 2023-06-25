#!/bin/bash

image_name="docker-nat-server"
container_name="docker-nat-server1"
default_network="docker-nat-network1"

green() {
    echo -e "\033[0;32m$1\033[0m"
}

blue() {
    echo -e "\033[0;34m$1\033[0m"
}

red() {
    echo -e "\033[0;31m$1\033[0m"
}


if command -v docker &> /dev/null; then
    :  
else
    red "Docker not found. Please install. Abort."
    exit 1
fi

image_id=$(docker images -q $image_name)

if [[ -n "$image_id" ]]; then
    container_status=$(docker ps -a --filter "name=$container_name" --format "{{.Status}}")
    if [[ -n "$container_status" ]]; then
        blue "Docker container stopping: $container_name"
        sudo docker stop $container_name > /dev/null
        red "Docker container stopped: $container_name"
        sudo docker rm $container_name > /dev/null
    fi
    blue "Docker container starting: $container_name"
    sudo docker run -d --cap-add=NET_ADMIN --network=$default_network --name $container_name $image_name > /dev/null
    green "$container_name container started."
else
    red "Error: $image_name docker image can not found. Abort."
fi