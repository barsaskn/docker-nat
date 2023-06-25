#!/bin/bash

image_name="docker-nat-server"

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

if sudo docker image inspect "$image_name" >/dev/null 2>&1; then
    blue "Docker image $image_name is removing..."
    blue "Related containers removing..."
    ./stop.sh
    sudo docker image remove $image_name > /dev/null
    green "Docker image $image_name is removed."
else
    red "Docker image is not exist."
fi


