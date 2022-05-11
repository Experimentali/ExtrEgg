FROM openjdk:11-jdk as java11
COPY --from=java11 /usr/local/openjdk-11 /usr/local/openjdk-11

FROM openjdk:17-jdk as java17
COPY --from=java17 /usr/java/openjdk-17 /usr/java/openjdk-17

FROM openjdk:8-jdk


LABEL author="ExperimentalX" maintainer="ExperimentalX"

LABEL org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL org.opencontainers.image.licenses=MIT

RUN         apt update -y \
						&& apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 toilet jq \
						&& useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./minecraft.sh /minecraft.sh

RUN chmod -f a+x /minecraft.sh || true

CMD ["/bin/bash", "/entrypoint.sh"]
