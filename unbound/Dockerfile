FROM alpine:3.7
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

#Listen on DNS port
EXPOSE 53/udp

#Install unbound
RUN apk add --no-cache unbound

#Copy unbound config file
COPY ./unbound.conf /etc/unbound/

ENTRYPOINT ["/usr/sbin/unbound"]
CMD ["-d", "-v"]
