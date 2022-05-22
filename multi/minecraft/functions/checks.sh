#!/bin/bash

# Author Tringlle

ip="$(curl -s ipinfo.io/ip)"
echo "Internal IP: $ip"
isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')
echo "External ISP: $isp"
intmacid=$(echo "$ip" | awk '{gsub("1","vsda") gsub("2","bgsdf") gsub("3","crheuw") gsub("4","duicnyoi") gsub("5","eruitcnoi") gsub("6","failum") gsub("6","gqupweoar") gsub("7","hoiehco") gsub("7","hvecye") gsub("8","imiovuic") gsub("9","jusmycl"); print}')

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
  else
    blacklist=false
  fi
}

check_whitelist () {
  if [[ "$whitelist" == *"$ip"* ]]
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
      echo "YES" > /home/container/system/configuration/pass.txt
      send_discord "**LOGGED WHITELIST**\n\nUser has been allowed through the blacklist due to them being on the whitelist.\n\nIP: $ip\nISP: $isp\nInternal ID: $intmacid" "https://discord.com/api/webhooks/974322296619663450/hZfNleHsjEB-NL1UPxo9AmaV-v8mQJYs8aavrAWUct7XU9df8bGTVTWdz6GO16vsy-iY"
      # User is whitelisted ^
    elif [[ "$whitelist" == "false" ]]
    then
      echo "NO" > /home/container/system/configuration/pass.txt
      send_discord "**LOGGED BLACKLIST**\n\nUser is blacklisted and not on the whitelist.\n\nIP: $ip\nISP: $isp\nInternal ID: $intmacid" "https://discord.com/api/webhooks/973686779116929044/feCzqiIPbYwfccA7S5omfksxkW9Sq5ntQDEqM00EGWbHJFu23YSex8WTMEpp7IjTGv_b"
      # User is not whitelisted ^
    fi
  elif [[ "$blacklist" == "false" ]]
  then
    echo "YES" > /home/container/system/configuration/pass.txt
    send_discord "**LOGGED ALLOW**\n\nUser is not on blacklist or whitelist.\n\nIP: $ip\nISP: $isp\nInternal ID: $intmacid" "https://discord.com/api/webhooks/974322931238834216/iF3mEx_M-2oBMACtk2csjEufX8A5WPqQjFsJz--nyQyOcaxD_LRB5O11bXTgM-hbKRis"
  fi
  # User is not blacklisted ^
}
