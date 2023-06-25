#!/bin/bash

container_name="docker-nat-client2"

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

if sudo docker container inspect $container_name >/dev/null 2>&1; then
    :
else
    red "$container_name is not running. Abort."
    exit 1
fi

blue "$container_name is stopping..."
sudo docker stop $container_name > /dev/null
blue "$container_name is removing..."
sudo docker rm $container_name > /dev/null
green "$container_name stopped."
