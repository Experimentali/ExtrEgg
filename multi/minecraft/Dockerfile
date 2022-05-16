FROM --platform=$TARGETOS/$TARGETARCH openjdk:11-slim AS java11

FROM --platform=$TARGETOS/$TARGETARCH openjdk:17-slim AS java17

FROM --platform=$TARGETOS/$TARGETARCH openjdk:8-slim-buster


COPY --from=java11 /usr/local/openjdk-11 /usr/local/openjdk-11
COPY --from=java17 /usr/local/openjdk-17 /usr/local/openjdk-17


LABEL author="ExperimentalX" maintainer="ExperimentalX"

LABEL org.opencontainers.image.source="https://github.com/Experimentali/ExtrEgg"
LABEL org.opencontainers.image.licenses=MIT

RUN         apt update -y \
						&& apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 toilet jq \
						&& useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./t.sh /minecraft.sh

ADD ./functions /functions

RUN chmod -f a+x /minecraft.sh || true
RUN /bin/bash -c 'chmod a+x /functions/ -R'                                                

CMD ["/bin/bash", "/entrypoint.sh"]
