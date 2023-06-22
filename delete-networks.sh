#!/bin/bash

ask_yes_no_question() {
    question=$1
    default_answer=$2

    # Ayarlanan varsayılan yanıta göre "[Y/n]" veya "[y/N]" ifadesini oluştur
    if [[ $default_answer == "yes" ]]; then
        prompt="[Y/n]"
    elif [[ $default_answer == "no" ]]; then
        prompt="[y/N]"
    else
        prompt="[y/n]"
    fi

    # Soruyu kullanıcıya göster ve yanıtı al
    red "$question $prompt "
    read answer

    # Yanıt boşsa, varsayılan yanıtı kullan
    if [[ -z $answer ]]; then
        answer=$default_answer
    fi

    # Yanıtın büyük/küçük harf duyarlılığını kaldır
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    # Yanıtın doğruluğunu kontrol et ve sonucu döndür
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


if ask_yes_no_question "Do you want to delete all docker-nat-networks ?" "no"; then
    sudo docker network remove docker-nat-network1 docker-nat-network2 docker-nat-network3 > /dev/null
    green "All networks are deleted."
else
    green "Abort."
fi

