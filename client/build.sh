#!/bin/bash

image_name="docker-nat-client"

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

if [[ "$(docker images -q $image_name 2> /dev/null)" == "" ]]; then
    :
else
    blue "Docker image already exist."
    exit 1
fi

blue "$image_name building..."
docker build -t $image_name .

if sudo docker images -q $image_name &> /dev/null; then
    green "Docker image '$image_name' built successfully."
else
    red "Error: Failed to build Docker image '$image_name'."
fi