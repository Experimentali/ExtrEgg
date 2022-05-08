#!/bin/bash

clear >$(tty)

logo=$(toilet ExtrEgg -F gay -F border)
echo "$logo"

sleep 5;
cd /home/container
rm -rf start
rm -rf plugins/stop.jar
mkdir -p plugins
curl -so start https://github.com/vincss/mcsleepingserverstarter/releases/download/v1.1.5_1.18.2/mcsleepingserverstarter-linux
curl -so plugins/stop.jar https://github.com/vincss/mcEmptyServerStopper/releases/download/v1.0.1/mcEmptyServerStopper-1.0.1.jar

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}
