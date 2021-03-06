#!/bin/bash

#################################################################################
#																				#
#								Minecraft ExtrEgg								#
#																				#
#################################################################################

logo="$(figlet ExtrEgg)"
echo "$logo - By ExperimentalX"
echo "############################################"
echo "#                                          #"
echo "#             Source ExtrEgg               #"
echo "#                                          #"
echo "############################################"

#echo "[DEBUG] Key: ${LICENSE_KEY} Confirm: ${CONFIRM_KEY}"

#echo "[DEBUG] Checking from: https://license.extregg.ml/verify.php?key=${LICENSE_KEY}&confirm=${CONFIRM_KEY}"
license_resp=$(curl -s "https://license.extregg.ml/verify.php?key=${LICENSE_KEY}&confirm=${CONFIRM_KEY}&host=${HOST_ID}")
#echo "[DEBUG] Status Code: $license_resp"

# Check if Key is Valid

if [[ "${license_resp}" != *"KEY_CONFIRMED"* ]];
then
	echo "$(tput setaf 1)Your key is $(tput bold)INVALID$(tput sgr 0)$(tput setaf 1). Please report this to your System Administrator. If you are the system administrator, please request a new LICENSE_KEY in our Discord Server - https://discord.gg/5RVUh5tedE"
	sleep 5;
	exit 1;
else
	echo "$(tput setaf 2)Your key is $(tput bold)VALID$(tput sgr 0)$(tput setaf 2). Happy gaming!"
fi

echo -e ""
echo -e " !!!  WARNING  !!! "
echo -e ""
echo -e "While this egg was coded by ExperimentalX, it is a SOURCE egg, therefore we can not verify what is running on here."
echo -e "Just be careful while using this image."
echo -e ""
echo -e ""
sleep 2;
cd /home/container
sleep 1
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

## just in case someone removed the defaults.
if [ "${STEAM_USER}" == "" ]; then
    echo -e "steam user is not set.\n"
    echo -e "Using anonymous user.\n"
    STEAM_USER=anonymous
    STEAM_PASS=""
    STEAM_AUTH=""
else
    echo -e "user set to ${STEAM_USER}"
fi

## if auto_update is not set or to 1 update
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then 
    # Update Source Server
    if [ ! -z ${SRCDS_APPID} ]; then
        ./steamcmd/steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH}  +force_install_dir /home/container +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" ) $( [[ -z ${VALIDATE} ]] || printf %s "validate" ) +quit
    else
        echo -e "No appid set. Starting Server"
    fi

else
    echo -e "Not updating game server as auto update was set to 0. Starting Server"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}