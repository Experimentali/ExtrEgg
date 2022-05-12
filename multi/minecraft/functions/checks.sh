#!/bin/bash

# Author Tringlle

ip="$(curl -s ipinfo.io/ip)"
echo "Internal IP: $ip"
isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')
echo "External ISP: $isp"

whitelist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/whitelist)
blacklist=$(curl -s https://extregg-api.tringlle.repl.co/api/system/blacklist)

create_files () {
  mkdir /home/container/system/configuration/ -p
  touch /home/container/system/configuration/pass.txt
  chmod a+xwr /home/container/system/configuration/pass.txt
}

source /functions/webhook.sh

check_blacklist () {
  if [[ "$blacklist" == *"$isp"* ]]
  then
    blacklist=true
    send_discord "**LOGGED BLACKLIST**\n\nMachine with IP $ip has logged in with ISP $isp and was blocked."
  else
    blacklist=false
  fi
}

check_whitelist () {
  if [[ "$whitelist" == *"$ip"* ]]
  then
    whitelist=true
    send_discord "**LOGGED WHITELIST**\n\nIP: $ip\nISP: $isp\nIP is Whitelisted"
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
