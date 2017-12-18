# Run handbrake in a container
# docker run -it --rm \
#        --net=host \
#        --device=/dev/cdrom \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.Xauthority:/root/.Xauthority \
#        -v $HOME/handbrake:/handbrake \
#        --env="DISPLAY" \
#        ecliptik/handbrake

# This Dockerfile uses Docker Multi-Stage Builds
# See https://docs.docker.com/engine/userguide/eng-image/multistage-build/

### Base Image
# Setup up a base image to use in Build and Runtime images
FROM ubuntu:16.04 AS base

LABEL maintainer "Micheal Waltz <ecliptik@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en-US

WORKDIR /handbrake

# Install runtime OS packages

RUN set -ex && \
        runDeps=' \
                gvfs \
                fonts-liberation \
                fonts-freefont-ttf \
                fontconfig \
                hicolor-icon-theme \
                software-properties-common \
        ' && \
    apt update && \
    apt install -y $runDeps && \
    apt clean

FROM base AS runtime

#Install handbrake ppa
RUN add-apt-repository ppa:stebbins/handbrake-releases && \
    apt update && \
    apt install -y handbrake-gtk handbrake-cli && \
    apt clean

# Copy font config
COPY local.conf /etc/fonts/local.conf

# Runtime command
ENTRYPOINT ["ghb"]
