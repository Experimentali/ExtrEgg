#!/bin/bash


group () {
  echo "1: Minecraft Java"
  echo "2: Minecraft Bedrock"
  echo "3: Minecraft Proxy"
  read group
  software
}

software () {
  if [[ "$group" == "1" ]]
  then
    echo "1: Vanilla"
    echo "2: Spigot"
    echo "3: Paper"
    echo "4: Purpur"
    read software
    version
  elif [[ "$group" == "2" ]]
  then
    echo "5: Select This - Choose Group in Next Step"
    read software
    version
  elif [[ "$group" == "3" ]]
  then
    echo "6: Bungeecord (Java)"
    echo "7: Velocity (Java)"
    read group
    version
  else
    echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version could not be found. Try agin?$(tput sgr 0)"
  fi

}

version () {
  if [[ "$software" == 1 ]]
  then
    echo "NOT SETUP: Latest Snapshot (as per updated)"
    echo "1.18.2: Version 1.18.2"
    echo "1.17.1: Version 1.17.1"
    echo "1.16.5: Version 1.16.5"
    echo "1.15.2: Version 1.15.2"
    echo "1.14.4: Version 1.14.4"
    echo "1.13.2: Version 1.13.2"
    echo "1.12.2: Version 1.12.2"
    echo "1.11.2: Version 1.11.2"
    echo "1.10.2: Version 1.10.2"
    echo "1.9.4: Version 1.9.4"
    echo "1.8.8: Version 1.8.9"
    read version
    finish_up

  elif [[ "$software" == 2 ]]
  then
    echo "1.18.2: Version 1.18.2"
    echo "1.17.1: Version 1.17.1"
    echo "1.16.5: Version 1.16.5"
    echo "1.15.2: Version 1.15.2"
    echo "1.14.4: Version 1.14.4"
    echo "1.13.2: Version 1.13.2"
    echo "1.12.2: Version 1.12.2"
    echo "1.11.2: Version 1.11.2"
    echo "1.10.2: Version 1.10.2"
    echo "1.9.4: Version 1.9.4"
    echo "1.8.8: Version 1.8.9"
    read version
    finish_up

  elif [[ "$software" == 3 ]]
  then
    echo "1.18.2: Version 1.18.2"
    echo "1.17.1: Version 1.17.1"
    echo "1.16.5: Version 1.16.5"
    echo "1.15.2: Version 1.15.2"
    echo "1.14.4: Version 1.14.4"
    echo "1.13.2: Version 1.13.2"
    echo "1.12.2: Version 1.12.2"
    echo "1.11.2: Version 1.11.2"
    echo "1.10.2: Version 1.10.2"
    echo "1.9.4: Version 1.9.4"
    echo "1.8.8: Version 1.8.9"
    read version
    finish_up

  elif [[ "$software" == 4 ]]
  then
    echo "1.18.2: Version 1.18.2"
    echo "1.17.1: Version 1.17.1"
    echo "1.16.5: Version 1.16.5"
    echo "1.15.2: Version 1.15.2"
    echo "1.14.4: Version 1.14.4"
    read version
    finish_up

  elif [[ "$software" == 5 ]]
  then
    echo "1.16: Nukkitx"
    echo "4.3.2: PocketMine"
    read version
    finish_up
    
  elif [[ "$software" == 6 ]]
  then
    echo "1.18: Version Latest"
    read version
    finish_up

  elif [[ "$software" == 7 ]]
  then
    echo "1.18: Version Latest"
    read version 
    finish_up

  fi
}

finish_up () {
  touch /home/container/system/configuration/version.txt
  echo "$software|$version" > /home/container/system/configuration/version.txt
}

if [[ ! -f server.jar ]]
then
  group
fi
