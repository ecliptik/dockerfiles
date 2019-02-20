FROM debian:stretch AS base
LABEL maintainer="ecliptik@gmail.com"

ENV VERSION="5.4.2"

WORKDIR /bfgminer
ENTRYPOINT ["bfgminer"]

#Install required packages for build and run
RUN apt update && \
    apt install -y libcurl4-gnutls-dev

#Build image
FROM base AS build

#Install required packages for build
RUN apt update && \
    apt install -y automake \
                   make \
                   build-essential \
                   curl \
                   git \
                   autoconf \
                   libtool \
                   libjansson-dev \
                   libncurses5-dev \
                   libudev-dev \
                   libusb-1.0-0-dev \
                   yasm \
                   uthash-dev \
                   unzip

#Download sourcecode
RUN curl -sSL http://luke.dashjr.org/programs/bitcoin/files/bfgminer/${VERSION}/bfgminer-${VERSION}.zip > ./bfgminer.zip && \
    unzip bfgminer.zip && \
    mv /bfgminer/bfgminer-${VERSION}/ /bfgminer/bfgminer/

WORKDIR /bfgminer/bfgminer

#Compile binary
RUN ./autogen.sh && \
    ./configure --enable-cpumining --enable-scrypt
RUN make -j

#Run image
FROM base AS run

#Copy compiled binary to WORKDIR for runtime
COPY --from=build /bfgminer/bfgminer/bfgminer /bfgminer/
