title=$(toilet ExtrEgg -F gay -F border)
echo "$title - By ExperimentalX"

sleep 1;

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}
