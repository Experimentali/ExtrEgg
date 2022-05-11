#!/bin/bash

# Author Tringlle

isp="$1"
ip="$(curl -s ipinfo.io/ip)"

whitelist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/whitelist)
blacklist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/blacklist)

touch /home/container/system/configurations/pass

check_blacklist {
  if [[ "$isp" == *"$blacklist"* ]]
  then
    blacklist=true
  else
    blacklist=false
  fi
}

check_whitelist {
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
    echo "YES" > /home/container/system/configurations/pass
  # User is whitelisted ^
  elif [[ "$whitelist" == "false" ]]
  then
    echo "NO" > /home/container/system/configurations/pass
  # User is not whitelisted ^
  fi
elif [[ "$blacklist" == "false" ]]
then
  echo "YES" > /home/container/system/configuration/pass
fi
# User is not blacklisted ^
