#docker run -it --rm \
#        --net=host \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/.bitcoin:/root/.bitcoin \
#        --env="DISPLAY" \
#        ecliptik/bitcoin-qt

FROM ubuntu:18.04
WORKDIR /bitcoin


RUN apt update && apt install -y gnupg2 \
     software-properties-common \
     apt-transport-https \
     ca-certificates \
     curl

#RUN echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu bionic main" > "/etc/apt/sources.list.d/bitcoin.list" && \
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D46F45428842CE5E

RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt update && apt install -y bitcoin-qt

ENTRYPOINT ["bitcoin-qt"]
