FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache iptables
WORKDIR /app
COPY configure-router.sh /app
ENV IPTABLES=iptables-legacy
RUN chmod +x /app/configure-router.sh
CMD ["/app/configure-router.sh"]
CMD ["tail", "-f", "/dev/null"]
