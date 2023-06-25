FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt install -y iproute2 iputils-ping net-tools
WORKDIR /app
COPY ./client1/configure-client1.sh /app
COPY ./client2/configure-client2.sh /app
COPY ./client3/configure-client3.sh /app
RUN chmod +x /app/configure-client1.sh
RUN chmod +x /app/configure-client2.sh
RUN chmod +x /app/configure-client3.sh
ENTRYPOINT ["tail", "-f", "/dev/null"]