#docker run -it --rm \
#        --net=host \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/.dogecoin:/root/.dogecoin \
#        --env="DISPLAY" \
#        ecliptik/dogecoin

FROM debian:sid
WORKDIR /dogecoin

RUN apt update && apt install -y dogecoin

ENTRYPOINT ["dogecoin-qt"]
