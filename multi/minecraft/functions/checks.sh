#!/bin/bash

# Author Tringlle

isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')
ip="$(curl -s ipinfo.io/ip)"

whitelist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/whitelist)
blacklist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/blacklist)

mkdir /home/container/system/configuration/ -p
touch /home/container/system/configuration/pass
chmod a+xwr /home/container/system/configuration/pass

check_blacklist () {
  if [[ "$isp" == *"$blacklist"* ]]
  then
    blacklist=true
  else
    blacklist=false
  fi
}

check_whitelist () {
  if [[ "$ip" == *"$whitelist"* ]]
  then
    whitelist=true
  else
    whitelist=false
  fi
}

if [[ "$blacklist" == "true" ]]
then
  # If they are blacklisted ^
  if [[ "$whitelist" == "true" ]]
  then
    echo "YES" > /home/container/system/configuration/pass
  # User is whitelisted ^
  elif [[ "$whitelist" == "false" ]]
  then
    echo "NO" > /home/container/system/configuration/pass
  # User is not whitelisted ^
  fi
elif [[ "$blacklist" == "false" ]]
then
  echo "YES" > /home/container/system/configuration/pass
fi
# User is not blacklisted ^
