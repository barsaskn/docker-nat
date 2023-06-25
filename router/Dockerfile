FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache iptables
WORKDIR /app
COPY ./router1/configure-router1.sh /app
COPY ./router2/configure-router2.sh /app
ENV IPTABLES=iptables-legacy
RUN chmod +x /app/configure-router1.sh
ENTRYPOINT ["tail", "-f", "/dev/null"]
