FROM ubuntu:16.04
LABEL maintainer="dockerfiles@ecliptik.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
     wget

WORKDIR /app
RUN wget https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb && \
    apt install -f -y ./*.deb && \
    rm -fr ./*.deb

CMD FAHClient
