FROM alpine:3.7
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

#Listen on DNS port
EXPOSE 53/udp

#Install unbound
RUN apk add --no-cache unbound bind-tools

#Get initial DNSSEC anchor file
RUN unbound-anchor

#Copy unbound config file
COPY ./unbound.conf /etc/unbound/

#Healthcheck
HEALTHCHECK CMD dig www.cloudflare.com || exit 1

ENTRYPOINT ["/usr/sbin/unbound"]
CMD ["-d", "-v"]
