#Docker image to run a gemini server
##Build: docker build -t gmnisrv .
##Run: docker run -it --rm -p 1965:1965 -v `pwd`:/srv/gemini/localhost gmnisrv

FROM debian:10-slim AS base
LABEL maintainer="<dockerfiles@accounts.ecliptik.com>"
ENV DEBIAN_FRONTEND noninteractive

#Install common packages for run and build layers
RUN apt-get update && apt-get install -y \
      mime-support \
      libssl1.1

#Build layer
#Install packages required for builds
FROM base AS build
RUN apt-get install -y \
        build-essential \
        git \
        libssl-dev \
        pkg-config

#Setup scdoc, required to build gmnisrv
#https://git.sr.ht/~sircmpwn/scdoc
FROM build AS scdoc
WORKDIR /var/tmp/scdoc/
RUN git clone --depth 1 https://git.sr.ht/~sircmpwn/scdoc .
RUN make PREFIX=/usr \
    && make PREFIX=/usr install

#Build gmnisrv
#https://git.sr.ht/~sircmpwn/gmnisrv
FROM scdoc AS gmnisrv
WORKDIR /var/tmp/gmnisrv/
RUN git clone --depth 1 https://git.sr.ht/~sircmpwn/gmnisrv .
WORKDIR /var/tmp/gmnisrv/build
RUN ../configure --prefix=/usr/local \
    && make \
    && make install

#Runtime layer
FROM base AS run
COPY --from=gmnisrv /usr/local /usr/local/
COPY gmnisrv.ini /usr/local/etc/
WORKDIR /srv/gemini/

#Run as daemon user
RUN mkdir -p /var/lib/gemini/certs \
    && chown -R daemon:daemon /var/lib/gemini /srv/gemini
USER daemon

#Run command
ENTRYPOINT ["/usr/local/bin/gmnisrv"]
