# Declare BASE image
FROM alpine:3.14


# Install required thingers
RUN  apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \ 
  && apk add --update openjdk8 openjdk11-jre-headless openjdk17-jre-headless tzdata curl unzip bash git --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/*

RUN echo '' > ~/.bashrc

# Install Python

RUN apk add --update python3 py3-pip


# NodeJS Versions
RUN curl -fLO https://github.com/oznu/alpine-node/releases/download/12.19.0/node-v12.19.0-linux-x86_64-alpine.tar.gz
RUN curl -fLO https://github.com/oznu/alpine-node/releases/download/14.18.1/node-v14.18.1-linux-x86_64-alpine.tar.gz
RUN curl -fLO https://github.com/oznu/alpine-node/releases/download/16.15.1/node-v16.15.1-linux-x86_64-alpine.tar.gz

RUN tar -xzf node-v12.19.0-linux-x86_64-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
RUN mv /usr/local/bin/npm /usr/local/bin/npm12
RUN mv /usr/local/bin/node /usr/local/bin/node12
RUN mv /usr/local/bin/npx /usr/local/bin/npx12

RUN tar -xzf node-v14.18.1-linux-x86_64-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
RUN mv /usr/local/bin/npm /usr/local/bin/npm14
RUN mv /usr/local/bin/node /usr/local/bin/node14
RUN mv /usr/local/bin/npx /usr/local/bin/npx14

RUN tar -xzf node-v16.15.1-linux-x86_64-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
RUN mv /usr/local/bin/npm /usr/local/bin/npm16
RUN mv /usr/local/bin/node /usr/local/bin/node16
RUN mv /usr/local/bin/npx /usr/local/bin/npx16
RUN mv /usr/local/bin/corepack /usr/local/bin/corepack16


#######################################

#           CONTAINER INFO

#######################################

# Declare ME maintainer
MAINTAINER Experimental, me@tringlle.ml

# Update some things & add the container user
RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig figlet ncurses \
    && adduser --disabled-password --home /home/container container

# Switch to container user
USER container
# Set user home, and user ENV vars
ENV  USER=container HOME=/home/container

# Set work dir
WORKDIR /home/container

# Copy entrypoint to inside docker
COPY ./entrypoint.sh /entrypoint.sh

# Execute entrypoint
CMD ["/bin/bash", "/entrypoint.sh"]