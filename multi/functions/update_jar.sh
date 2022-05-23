#!/bin/bash

data=$(cat /home/container/system/configuration/version.txt)

IFS="|"
read -a strarr <<< "$data"

software="${strarr[0]}"
version="${strarr[1]}"

echo "$software - $version"

source /functions/download.sh

if [[ "$version" == "1.16" ]]
then
  download_nukkitx
elif [[ "$version" == "4.3.2" ]]
then
  download_pocketmine
elif [[ "$software" == "1" ]]
then
  download_vanilla $version
elif [[ "$software" == "2" ]]
then
  download_spigot $version
elif [[ "$software" == "3" ]]
then
  download_paper $version
elif [[ "$software" == "4" ]]
then
  download_purpur $version
elif [[ "$software" == "6" ]]
then
  download_waterfall
elif [[ "$software" == "7" ]]
then
  download_velocity
elif [[ "$software" == "C" ]]
then
  if [[ ! -f "/home/container/server.jar" ]]
  then
    echo "FAILURE It appears you do not have a jar selected. Please confirm your jar is uploaded and named 'server.jar'."
  fi
else
  echo "FAILURE Your version could not be found. Please try again."
  rm -rf /home/container/system/configuration/version.txt
  exit 1;
fi
