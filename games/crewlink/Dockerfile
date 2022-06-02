FROM  node:12-buster-slim

LABEL author="ExperimentalX" maintainer="me@tringlle.ml"

RUN   apt update \
   && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils zip \
      build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev git curl figlet \
   && useradd -m -d /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

RUN npm install yarn

COPY ./entrypoint.sh /entrypoint.sh
CMD  ["/bin/bash", "/entrypoint.sh"]