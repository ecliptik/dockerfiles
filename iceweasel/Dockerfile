#docker run -it --rm \
#        --net=host \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/.config:/root/.bitcoin \
#        --env="DISPLAY" \
#        ecliptik/iceweasel

FROM debian:stretch
WORKDIR /firefox

RUN apt update && apt install -y iceweasel

ENTRYPOINT ["iceweasel"]
