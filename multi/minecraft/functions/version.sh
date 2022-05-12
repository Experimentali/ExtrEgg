#!/bin/bash


group () {
  echo "1: Minecraft Java"
  echo "2: Minecraft Bedrock"
  echo "3: Minecraft Proxy"
  read group
  case $group in
    1|2|3)
      software;;
    *)
      echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
  esac
}

software () {
  if [[ group == "1" ]]
  then
    echo "1: Vanilla"
    echo "2: Spigot"
    echo "3: Paper"
    echo "4: Purpur"
    read software
  elif [[ group == "2" ]]
  then
    echo "5: Vanilla"
    read software
  elif [[ group == "3" ]]
  then
    echo "6: Bungeecord (Java)"
    echo "7: Velocity (Java)"
    read group
  else
    echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version could not be found. Try agin?$(tput sgr 0)"
  fi
  case $software in
    1|2|3|4|5|6|7)
      version;;
    *)
      echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your sofware group was not found. Please use the number corresponding to your software group.";;
  esac
}

version () {
  if [[ "$software" == 1 ]]
  then
    echo "1: Latest Snapshot (as per updated)"
    echo "2: Version 1.18.2"
    echo "3: Version 1.17.1"
    echo "4: Version 1.16.5"
    echo "5: Version 1.15.2"
    echo "6: Version 1.14.4"
    echo "7: Version 1.13.2"
    echo "8: Version 1.12.2"
    echo "9: Version 1.11.2"
    echo "10: Version 1.10.2"
    echo "11: Version 1.9.4"
    echo "12: Version 1.8.9"
    read version
    case $version in
      1|2|3|4|5|6|7|8|9|10|11|12)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 2 ]]
  then
    echo "13: Version 1.18.2"
    echo "14: Version 1.17.1"
    echo "15: Version 1.16.5"
    echo "16: Version 1.15.2"
    echo "17: Version 1.14.4"
    echo "18: Version 1.13.2"
    echo "19: Version 1.12.2"
    echo "20: Version 1.11.2"
    echo "21: Version 1.10.2"
    echo "22: Version 1.9.4"
    echo "23: Version 1.8.9"
    read version
    case $version in
      13|14|15|16|17|18|19|20|21|22|23)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 3 ]]
  then
    echo "24: Version 1.18.2"
    echo "25: Version 1.17.1"
    echo "26: Version 1.16.5"
    echo "27: Version 1.15.2"
    echo "28: Version 1.14.4"
    echo "29: Version 1.13.2"
    echo "30: Version 1.12.2"
    echo "31: Version 1.11.2"
    echo "32: Version 1.10.2"
    echo "33: Version 1.9.4"
    echo "34: Version 1.8.9"
    read version
    case $version in
      24|25|26|27|28|29|30|31|32|33|34)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 4 ]]
  then
    echo "35: Version 1.18.2"
    echo "36: Version 1.17.1"
    echo "37: Version 1.16.5"
    echo "38: Version 1.15.2"
    echo "39: Version 1.14.4"
    read version
    case $version in
      35|36|37|38|39)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 5 ]]
  then
    echo "40: Version Latest"
    read version
    case $version in
      40)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 6 ]]
  then
    echo "41: Version Latest"
    read version 
    case $version in
      41)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
  elif [[ "$software" == 7 ]]
  then
    echo "42: Version Latest"
    read version 
    case $version in
      42)
        finish_up;;
      *)
        echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)Your version was not in the specified list. Please use the number corresponding to your version."
    esac
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
