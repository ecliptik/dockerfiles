FROM alpine:3.7
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

#Listen on DNS port
EXPOSE 53/udp

#Install unbound
RUN apk add --no-cache unbound bind-tools

#Copy unbound config file
COPY ./unbound.conf /etc/unbound/

#Healthcheck
HEALTHCHECK CMD dig @127.0.0.1 www.cloudflare.com || exit 1

ENTRYPOINT ["/usr/sbin/unbound"]
CMD ["-d", "-v"]
