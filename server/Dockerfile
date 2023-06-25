FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt install -y iproute2 iputils-ping net-tools
WORKDIR /app
ENTRYPOINT ["tail", "-f", "/dev/null"]
