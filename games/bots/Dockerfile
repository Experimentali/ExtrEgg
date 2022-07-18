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


# NodeJS Manager
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh|bash
RUN export NVM_DIR="$HOME/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install node versions
RUN nvm install 12
RUN nvm install 14
RUN nvm install 16

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