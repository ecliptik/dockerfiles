# Run makemkv in a container
# docker run -it --rm \
#        --net=host \
#        --device=/dev/cdrom \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/.MakeMKV:/root/.MakeMKV
#        -v `pwd`/makemkv:/makemkv
#        --env="DISPLAY" \
#        ecliptik/makemkv

# While in beta makemkv is free, find the registratio key here,
# https://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053

# This Dockerfile uses Docker Multi-Stage Builds
# See https://docs.docker.com/engine/userguide/eng-image/multistage-build/

### Base Image
# Setup up a base image to use in Build and Runtime images
FROM debian:stretch AS base

LABEL maintainer "Micheal Waltz <ecliptik@gmail.com>"

ENV MAKEMKV_VER="1.10.8" \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en-US

WORKDIR /makemkv

# Install runtime OS packages
RUN apt update && \
    apt install -y \
          libglib2.0-0 \
          libdbus-1-3 \
          libbsd0 \
          libidn11 \
          fonts-liberation \
          fonts-freefont-ttf \
          fontconfig \
          hicolor-icon-theme \
          wget \
          && \
    apt clean

#Download and extract tarballs

### Build Image
# Installs build dependencies and npm packages
# Creates artifacts to copy into Runtime image
FROM base AS build

# Install build OS packages
RUN apt update && \
    apt install -y \
          file \
          build-essential \
          pkg-config \
          less \
          libc6-dev \
          libssl-dev \
          libexpat1-dev \
          libavcodec-dev \
          libgl1-mesa-dev \
          libqt4-dev \
          zlib1g-dev\
          && \
    apt clean

#Download and extract tarballs
RUN wget http://www.makemkv.com/download/makemkv-bin-$MAKEMKV_VER.tar.gz
RUN wget http://www.makemkv.com/download/makemkv-oss-$MAKEMKV_VER.tar.gz

RUN tar -xvzf makemkv-bin-$MAKEMKV_VER.tar.gz
RUN tar -xvzf makemkv-oss-$MAKEMKV_VER.tar.gz

#Build makemkv
RUN cd makemkv-oss-$MAKEMKV_VER && \
    ./configure && \
    make -j && \
    make install && \
    cd /makemkv

RUN cd makemkv-bin-$MAKEMKV_VER && \
    echo "/bin/cat" > ./src/ask_eula.sh && \
    make -j && \
    make install && \
    cd /makemkv

### Runtime Image
# Copy artifacts from Build image and setups up entrypoint/cmd to run app
FROM base AS runtime

# Copy artifacts from Build Image
COPY --from=build /usr/ /usr/

# Copy font config
COPY local.conf /etc/fonts/local.conf

# Runtime command
ENTRYPOINT ["makemkv"]
CMD ["--help"]
