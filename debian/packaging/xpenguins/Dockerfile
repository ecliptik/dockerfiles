FROM debian:bullseye

LABEL maintainer="docker@accounts.ecliptik.com"

ENV DEBEMAIL="ecliptik@gmail.com" \
    DEBFULLNAME="Micheal Waltz" \
    LANGUAGE="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

RUN apt-get update && apt-get install -y \
    build-essential \
    dput \
    devscripts \
    debhelper \
    dpkg-dev \
    dh-make \
    git-buildpackage \
    gir1.2-glib-2.0 \
    libgtk-3-dev \
    libgtk-3-0 \
    libx11-dev \
    libxext-dev \
    libxpm-dev \
    libxt-dev \
    locales \
    x11proto-core-dev \
    libatk1.0-0 \
    libc6 \
    libcairo-gobject2 \
    libcairo2 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libx11-6 \
    libxext6 \
    libxpm4 \
    libxt6

#Generate locales
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen
