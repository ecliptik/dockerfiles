#docker run -it --rm \
#        --net=host \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/.bitcoin:/root/.bitcoin \
#        --env="DISPLAY" \
#        ecliptik/bitcoin-qt

FROM debian:sid
WORKDIR /bitcoin

RUN apt update && apt install -y bitcoin-qt

ENTRYPOINT ["bitcoin-qt"]
