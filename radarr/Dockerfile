FROM mono:5 AS base
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

ENV VERSION=0.2.0.1067

WORKDIR /app

RUN apt update && \
    apt install -y libmono-cil-dev \
                   mediainfo \
                   curl

FROM base AS build

RUN apt update && apt install -y wget
RUN curl -sSL https://github.com/Radarr/Radarr/releases/download/v${VERSION}/Radarr.develop.${VERSION}.linux.tar.gz > /tmp/radarr.tar.gz
RUN tar -xvzf /tmp/radarr.tar.gz

FROM base AS run
COPY --from=build /app /app

EXPOSE 7878
VOLUME /root/.config/Radarr

ENTRYPOINT ["/usr/bin/mono"]
CMD ["--debug", "/app/Radarr/Radarr.exe", "-nobrowser"]
