#!/bin/bash

clear >$(tty)

logo=$(toilet ExtrEgg -F gay -F border)
echo "$logo"

sleep 5;


MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}
