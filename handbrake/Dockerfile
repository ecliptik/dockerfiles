# Run handbrake GUI in a container
# docker run -it --rm \
#        --net=host \
#        --device=/dev/cdrom \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/handbrake:/handbrake \
#        --env="DISPLAY" \
#        handbrake

# Run HandBrakeCLI in a container
# docker run -it --rm \
#        --entrypoint=HandBrakeCLI \
#        -v $HOME/handbrake:/handbrake \
#        handbrake

# This Dockerfile uses Docker Multi-Stage Builds
# See https://docs.docker.com/engine/userguide/eng-image/multistage-build/

### Base Image
# Setup up a base image to use in Build and Runtime images
FROM ubuntu:20.04 AS base

LABEL maintainer "Micheal Waltz <dockerfiles@ecliptik.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8

WORKDIR /handbrake

# Runtime packages
RUN apt-get update && \
    apt-get install -y \
          libmp3lame0 \
          libvorbis0a \
          libass9 \
          libsamplerate0 \
          libtheora0 \
          libvorbisenc2 \
          libx264-155 \
          libjansson4 \
          liblzma5 \
          lzma \
          libopus0 \
          libnotify4 \
          libdbus-glib-1-2 \
          libgstreamer-plugins-base1.0-0 \
          libwebkit2gtk-4.0-37 \
          libdvd-pkg \
          libvpx6 \
          speex \
        && \
        apt-get clean

# Build image
FROM base AS build

# Build packages
RUN apt-get update && \
    apt-get install -y \
          appstream \
          autoconf \
          automake \
          build-essential \
          cmake \
          git \
          libass-dev \
          libbz2-dev \
          libfontconfig1-dev \
          libfreetype6-dev \
          libfribidi-dev \
          libharfbuzz-dev \
          libjansson-dev \
          libmp3lame-dev \
          libnuma-dev \
          libogg-dev \
          libopus-dev \
          libsamplerate-dev \
          libspeex-dev \
          lzma-dev \
          liblzma-dev \
          libvpx-dev \
          ninja-build \
          python-speex \
          libspeexdsp-dev \
          libtheora-dev \
          libtool \
          libvorbis-dev \
          libx264-dev \
          libxml2-dev \
          m4 \
          make \
          nasm \
          patch \
          pkg-config \
          python \
          python3-pip \
          tar \
          yasm \
          zlib1g-dev \
          libtool-bin \
          intltool \
          libappindicator-dev \
          libdbus-glib-1-dev \
          libglib2.0-dev \
          libgstreamer1.0-dev \
          libgstreamer-plugins-base1.0-dev \
          libgtk-3-dev \
          libgudev-1.0-dev \
          libnotify-dev \
          libwebkit2gtk-4.0-dev \
          libturbojpeg0-dev \
          wget \
          && \
    apt-get clean

#Install meson build system
#https://mesonbuild.com/Quick-guide.html

RUN pip3 install meson

#Download source from Github
RUN git clone --depth=1 https://github.com/HandBrake/HandBrake.git
WORKDIR /handbrake/HandBrake
RUN ./configure --launch-jobs=$(nproc) --launch
RUN cd build && make install

# Runtime image
FROM base AS runtime

# Copy HandBrakeCLI and ghb binaries to runtime image
COPY --from=build /handbrake/HandBrake/build/HandBrakeCLI /usr/local/bin
COPY --from=build /handbrake/HandBrake/build/gtk/src/ghb /usr/local/bin

# Make binaries executable
RUN chmod +x /usr/local/bin/HandBrakeCLI
RUN chmod +x /usr/local/bin/ghb

# Copy font config
COPY local.conf /etc/fonts/local.conf

# Runtime command
ENTRYPOINT ["ghb"]
