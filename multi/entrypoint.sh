#!/bin/bash

clear >$(tty)

logo=$(toilet ExtrEgg -F gay -F border)
echo "$logo - By ExperimentalX: https://github.com/Experimentali"

sleep 1;
cd /home/container

ip=$(curl ipinfo.io/ip
blocked=$(cat /blocked.txt)
if [[ $blocked == *"$ip"* ]]
then
  echo "FAILURE   It appears you are using a free trial cloud service."
  echo ""
  echo "Would you like to request a whitelist (Y/n)"
  read req
  if [[ req == "y" ]]
  then
    echo "You will now request a whitelist, please note your server IP will be shared with us."
    echo "Please enter your Discord Username: " 
    read name
    if [[ $name != null ]]
    then
      echo "Name set."
      echo "What is your email: "
      read email
      if [[ $email != null ]]
      then
        echo "Email set."
        echo "We are now sending the request. Please note it can take up to 72 hours for your request to be approved or denied. If its been longer than that, presume you got denied."
        echo "Please join our official discord server so we can update you on your status."
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
${MODIFIED_STARTUP}
