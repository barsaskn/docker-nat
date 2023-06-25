FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt install -y iptables 
WORKDIR /app
ENTRYPOINT ["tail", "-f", "/dev/null"]
