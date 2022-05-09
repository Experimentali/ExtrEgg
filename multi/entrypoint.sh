#!/bin/bash

clear >$(tty)

logo=$(toilet ExtrEgg -F gay -F border)
echo "$logo - By ExperimentalX: https://github.com/Experimentali"

sleep 1;
cd /home/container

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}
