#docker run -it --rm \
#        -p 5900:5900 \
#        -v $(pwd)/GNUstep:/root/GNUstep \
#        ecliptik/windowmaker

FROM debian:bookworm
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

#vnc port
EXPOSE 5900

#Install packages
RUN apt update && \
    apt install -y wmaker \
                   surf \
                   firefox-esr \
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
                   x11-apps \
                   tk \
                   libvncclient1 \
                   libvncserver1 \
                   xvfb && \
    apt clean

#Install pactched version of v11vnc
#See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=859213
RUN curl -LO https://mirrors.edge.kernel.org/debian/pool/main/x/x11vnc/x11vnc_0.9.16-9_$(dpkg --print-architecture).deb
RUN curl -LO https://mirrors.edge.kernel.org/debian/pool/main/x/x11vnc/x11vnc-data_0.9.13-6%2Bdeb10u1_all.deb
RUN dpkg --install *.deb && rm -fr *.deb

#launch wmaker
RUN echo 'exec wmaker &' > /root/.xinitrc
RUN chmod +x /root/.xinitrc

#Run supervisor since multiple processes are needed
ENTRYPOINT [ "x11vnc" ]
CMD [ "-forever", "-nopw", "-create", "-noxdamage", "-scale", "2880x1800", "-ncache_cr", "-norepeat" ]
