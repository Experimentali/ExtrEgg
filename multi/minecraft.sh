#!/bin/bash
cd /home/container || exit
mem="$1"

hashprint () {
    echo "##############################################################"
    echo "$1"
    echo "##############################################################"
}

not_exist () {
    echo " It appears you do not have a jar installed. Please select one below."
    
    echo "1 Paper"
    echo "2 Purpur"
    echo "3 Waterfall (Bungeecord)"
    echo "4 Velocity"
    
    echo ""
    echo "Pick your selection:"
    read platform
    if [[ $platform == "1" ]]
    then
      echo "Avaliable Versions: 1.8.8, 1.9.4, 1.10.2, 1.11.2, 1.12.2, 1.13.2, 1.14.4, 1.15.2, 1.16.5, 1.17.1, 1.18.1, 1.18.2"
      read paperversion
      echo "You selected $paperversion"
      touch delete-to-pick-new-server.donttouch
      echo "PAPER|$paperversion" > delete-to-pick-new-server.donttouch
    elif [[ $platform == "2" ]]
    then
      echo "Avaliable Versions: 1.14.4, 1.15.2, 1.16.5, 1.17.1, 1.18.1, 1.18.2"
      read purpurver
      echo "You selected $purpurver"
      echo "PURPUR|$purpurver" > delete-to-pick-new-server.donttouch
    elif [[ $platform == "3" ]]
    then
      echo "Latest Bungeecord Selected"
      touch delete-to-pick-new-server.donttouch
      echo "BUNGEE|latest" > delete-to-pick-new-server.donttouch
    elif [[ $platform == "4" ]]
    then
      echo "Latest Velocity Selected"
      touch delete-to-pick-new-server.donttouch
      echo "VELOCITY|latest" > delete-to-pick-new-server.donttouch
    else
      echo "FAILURE Your selection was invalid. Please try again."
      exit 1;
    fi
    
    echo "SUCCESS You have set your version. Please start the server now."
    exit 1;
    
}

exists () {
    rm -rf server.jar
    if [[ $1 == "PAPER" ]]
    then
      if [[ $2 == "1.8.8" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
      elif [[ $2 == "1.9.4" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.9.4/builds/775/downloads/paper-1.9.4-775.jar
      elif [[ $2 == "1.10.2" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.10.2/builds/918/downloads/paper-1.10.2-918.jar
      elif [[ $2 == "1.11.2" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.11.2/builds/1106/downloads/paper-1.11.2-1106.jar
      elif [[ $2 == "1.12.2" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
      elif [[ $2 == "1.13.2" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.13.2/builds/657/downloads/paper-1.13.2-657.jar
      elif [[ $2 == "1.14.4" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.14.4/builds/245/downloads/paper-1.14.4-245.jar
      elif [[ $2 == "1.15.2" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.15.2/builds/393/downloads/paper-1.15.2-393.jar
      elif [[ $2 == "1.16.5" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar
      elif [[ $2 == "1.17.1" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar
      elif [[ $2 == "1.18.1" ]]
      then
        curl -so server.jar https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/319/downloads/paper-1.18.2-319.jar
      elif [[ $2 == "1.18.2" ]]
      then
        curl -so server.jar papermc.io/api/v2/projects/paper/versions/1.18.2/builds/325/downloads/paper-1.18.2-325.jar
      else
        echo "ERROR Your version could not be found. Please try again."
        rm -rf delete-to-pick-new-server.donttouch
        exit 1;
      fi
    elif [[ $1 == "PURPUR" ]]
    then
      if [[ $2 == "1.14.4" ]]
      then
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.14.4/latest/download
      elif [[ $2 == "1.15.2" ]]
      then
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.15.2/latest/download
      elif [[ $2 == "1.16.5" ]]
      then
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.16.5/latest/download
      elif [[ $2 == "1.17.1" ]]
      then
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.17.1/latest/download
      elif [[ $2 == "1.18.1" ]]
      then 
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.18.1/latest/download
      elif [[ $2 == "1.18.2" ]]
      then
        curl -so server.jar https://api.purpurmc.org/v2/purpur/1.18.2/latest/download
      else
        echo "ERROR Your version could not be found. Please try again."
        rm -rf delete-to-pick-new-server.donttouch
        exit 1;
      fi
    elif [[ $1 == "BUNGEE" ]]
    then
      curl -so server.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
      curl -s https://api.spiget.org/v2/resources/88636/download
      mv 88636.jar plugins/88636.jar
    elif [[ $1 == "VELOCITY" ]]
    then
      curl -so server.jar https://papermc.io/api/v2/projects/velocity/versions/3.1.2-SNAPSHOT/builds/137/downloads/velocity-3.1.2-SNAPSHOT-137.jar
    else
        echo "ERROR Your version could not be found. Please try again."
        rm -rf delete-to-pick-new-server.donttouch
        exit 1;
    fi
      
exec java -Xmx${mem}M -Xms512M -DPaper.IgnoreJavaVersion=true -jar server.jar nogui
exit 1;
}



if [ ! -f delete-to-pick-new-server.donttouch ]
then
  not_exist
else
  text=$(cat delete-to-pick-new-server.donttouch)
  IFS='|'
  read -ra parsed <<< "$text"
  hashprint "Software: ${parsed[0]} | Version: ${parsed[1]}"
  exists "${parsed[0]}" "${parsed[1]}"
fi
