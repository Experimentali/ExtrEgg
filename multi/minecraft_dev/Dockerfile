FROM        --platform=$TARGETOS/$TARGETARCH openjdk:11-slim

LABEL       author="ExperimentalX" maintainer="ExperimentalX"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
						&& apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 toilet \
						&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./minecraft.sh /minecraft.sh

RUN chmod -f a+x /minecraft.sh || true

RUN rm -rf start \
	&& rm -rf plugins/stop.jar \
	&& mkdir -p plugins \
	&& curl -so start https://github.com/vincss/mcsleepingserverstarter/releases/download/v1.1.5_1.18.2/mcsleepingserverstarter-linux \
	&& curl -so plugins/stop.jar https://github.com/vincss/mcEmptyServerStopper/releases/download/v1.0.1/mcEmptyServerStopper-1.0.1.jar

CMD ["/bin/bash", "/entrypoint.sh"]
