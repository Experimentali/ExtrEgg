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
COPY ./t.sh /minecraft.sh
COPY ./functions/checks.sh /functions/checks.sh

RUN chmod -f a+x /minecraft.sh || true

CMD ["/bin/bash", "/entrypoint.sh"]
