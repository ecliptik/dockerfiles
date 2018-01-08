#docker run -it --rm \
#        -p 5900:5900 \
#        -v $(pwd)/GNUstep:/root/GNUstep \
#        ecliptik/windowmaker

FROM debian:stretch
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

#vnc port
EXPOSE 5900

#Install packages
RUN apt update && \
    apt install -y wmaker \
                   midori \
                   surf \
                   iceweasel \
                   git \
                   libxtst6 \
                   net-tools \
                   curl \
                   menu \
                   wmaker-data \
                   wmaker-utils \
                   wmnet \
                   wmmemload \
                   asmon \
                   aterm \
                   x11-apps \
                   tk \
                   libvncclient1 \
                   libvncserver1 \
                   xvfb && \
    apt clean

#Install pactched version of v11vnc
#See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=859213
RUN curl -LO http://bernhard-ehlers.de/x11vnc/x11vnc_0.9.13-2.0_amd64.deb
RUN curl -LO http://bernhard-ehlers.de/x11vnc/x11vnc-data_0.9.13-2.0_all.deb
RUN dpkg --install *.deb && rm -fr *.deb

#launch wmaker
RUN echo 'exec wmaker &' > /root/.xinitrc
RUN chmod +x /root/.xinitrc

#Run supervisor since multiple processes are needed
ENTRYPOINT [ "x11vnc" ]
CMD [ "-forever", "-nopw", "-create", "-noxdamage", "-scale", "2880x1880", "-ncache_cr", "-norepeat" ]
