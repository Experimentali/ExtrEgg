#!/bin/bash

data=$(cat /home/container/system/configuration/version.txt)

arrIN=(${data//;/ })
software=${arrIN[0]}
version=${arrIN[1]}

echo "$software - $version"

source /functions/download.sh

if [[ "$version" == "1.16" ]]
then
  download_nukkitx
elif [[ "$version" == "4.3.2" ]]
then
  download_pocketmine
fi

if [[ "$software" == "1" ]]
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
else
  echo "FAILURE Your version could not be found. Please try again."
  exit 1;
fi
