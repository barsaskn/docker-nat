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

if command -v docker &> /dev/null; then
    :  
else
    red "Docker not found. Please install. Abort."
    exit 1
fi

green "Stopping all clients"
./client1/stop.sh
./client2/stop.sh
./client3/stop.sh