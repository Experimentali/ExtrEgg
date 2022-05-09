FROM        --platform=$TARGETOS/$TARGETARCH openjdk:17-slim

LABEL       author="ExperimentalX" maintainer="ExperimentalX"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
						&& apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 toilet \
						&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY ./../entrypoint.sh /entrypoint.sh
COPY ./../minecraft.sh /minecraft.sh
COPY ./../blocked-ips.txt /blocked.txt
COPY ./../discord.sh /discord.sh

RUN chmod -f a+x /minecraft.sh || true
RUN chmod -f a+x /discord.sh || true

CMD ["/bin/bash", "/entrypoint.sh"]
