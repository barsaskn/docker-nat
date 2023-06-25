#!/bin/bash

ask_yes_no_question() {
    question=$1
    default_answer=$2

    if [[ $default_answer == "yes" ]]; then
        prompt="[Y/n]"
    elif [[ $default_answer == "no" ]]; then
        prompt="[y/N]"
    else
        prompt="[y/n]"
    fi

    red "$question $prompt "
    read answer

    if [[ -z $answer ]]; then
        answer=$default_answer
    fi

    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    if [[ $answer == "yes" || $answer == "y" ]]; then
        return 0  # true
    else
        return 1  # false
    fi
}

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

if ask_yes_no_question "Do you want to delete all docker-nat-networks ?" "no"; then
    sudo docker network remove docker-nat-network1 docker-nat-network2 docker-nat-network3 > /dev/null
    green "All networks are deleted."
else
    green "Abort."
fi
