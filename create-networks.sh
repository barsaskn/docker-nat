#!/bin/bash

green() {
    echo -e "\033[0;32m$1\033[0m"
}

blue() {
    echo -e "\033[0;34m$1\033[0m"
}

red() {
    echo -e "\033[0;31m$1\033[0m"
}

check_network_exists() {
    network_name=$1
    if docker network inspect $network_name &> /dev/null; then
        return 0 #true
    else
        return 1 #false
    fi
}



if command -v docker &> /dev/null; then
    green "Docker found. Creating networks..."
else
    red "Docker not found. Please install. Abort."
    exit 1
fi

if check_network_exists "docker-nat-network1"; then
    blue "Network 'docker-nat-network1' exists. Skipping..."
else
    sudo docker network create --driver=bridge docker-nat-network1 --subnet=200.1.1.0/24 --gateway 200.1.1.1> /dev/null
    green "Network 1 is created."
fi

if check_network_exists "docker-nat-network2"; then
    blue "Network 'docker-nat-network2' exists. Skipping..."
else
    sudo docker network create --driver=bridge docker-nat-network2 --subnet=172.0.0.0/24 --gateway 172.0.0.1 > /dev/null
    green "Network 2 is created."
fi

if check_network_exists "docker-nat-network3"; then
    blue "Network 'docker-nat-network3' exists. Skipping..."
else
    sudo docker network create --driver=bridge docker-nat-network3 --subnet=172.0.1.0/24 --gateway 172.0.1.1 > /dev/null
    green "Network 3 is created."
fi

green "done."



