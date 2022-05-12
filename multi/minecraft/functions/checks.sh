#!/bin/bash

# Author Tringlle

ip="$(curl -s ipinfo.io/ip)"
isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')

whitelist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/whitelist)
blacklist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/blacklist)

create_files () {
  mkdir /home/container/system/configuration/ -p
  touch /home/container/system/configuration/pass.txt
  chmod a+xwr /home/container/system/configuration/pass.txt
}

check_blacklist () {
  if [[ "$isp" == *"Google"* ]]
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

echo_to_file () {
  if [[ "$blacklist" == "true" ]]
  then
    # If they are blacklisted ^
    if [[ "$whitelist" == "true" ]]
    then
      echo "YES" | tee /home/container/system/configuration/pass.txt
      # User is whitelisted ^
    elif [[ "$whitelist" == "false" ]]
    then
      echo "NO" | tee /home/container/system/configuration/pass.txt
      # User is not whitelisted ^
    fi
  elif [[ "$blacklist" == "false" ]]
  then
    echo "YES" | tee /home/container/system/configuration/pass.txt
  fi
  # User is not blacklisted ^
}
