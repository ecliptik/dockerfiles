# Run abcde ripper in a container
# docker run -it --rm \
#        --device=/dev/cdrom \
#        -v `pwd`/music:/music \
#        ecliptik/abcde \
#        -a cddb,read,encode,tag,move,playlist,clean -d /dev/cdrom -o m4a -V -x

FROM ubuntu:16.04
LABEL maintainer "Micheal Waltz <ecliptik@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /music

RUN apt update && apt install -y \
        abcde \
        faac \
        eject \
        fdkaac \
	&& rm -rf /var/lib/apt/lists/*

COPY .abcde.conf /root/

ENTRYPOINT ["abcde"]
CMD ["--help"]
