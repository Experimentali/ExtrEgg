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
      curl -s https://cdn.spiget.org/file/spiget-resources/88636.jar
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

ip=$(curl -s ipinfo.io/ip)
echo "$ip"
txt=$(curl "http://ip-api.com/json/$ip" | jq -r '.isp')
wl=$(cat /whitelist.txt)

if [[ "$txt" == *"$blacklist"* ]] && [[ ! "$ip" == *"$wl"* ]]
then
  echo "FAILURE   It appears you are using a free trial cloud service."
  echo ""
  echo "Would you like to request a whitelist. Only request a whitelist if you are actively paying for the service. This egg does NOT allow free trial cloud services.(Y/n)"
  read req
  if [[ $req == "y" ]] | [[ $req == "Y" ]]
  then
    echo "You will now request a whitelist, please note your server IP will be shared with us."
    echo "Please enter your Discord Username: " 
    read name
    if [[ $name != null ]]
    then
      echo "Name set."
      echo "What is your email: "
      read email
      if [[ $email != null ]]
      then
        echo "Email set."
        echo "We are now sending the request. Please note it can take up to 72 hours for your request to be approved or denied. If its been longer than that, presume you got denied."
        echo "Please join our official discord server so we can update you on your status."
        message="Whitelist Request from $ip - Discord: $name - Email: $email"
        ## format to parse to curl
        ## echo Sending message: $message
        msg_content=\"$message\"

        ## discord webhook
        url='https://discord.com/api/webhooks/973240709400375357/fDL8JDxXRkoYFGptEiwoNiBayyuwBT6sRAyudycBszkWMUwMpqgAKOX7epY4j40fScjY'
        curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
        exit 1;
      else
        echo "FAILURE: You did not set the email. Canceled."
        exit 1;
      fi
    else
      echo "FAILURE: You did not set the name. Canceled."
      exit 1;
    fi
  else
    echo "FAILURE: Request Canceled."
    exit 1;
  fi
fi


ip="$(curl -s ipinfo.io/ip)"
id=$(echo "$ip" | awk '{gsub("1","a") gsub("2","b") gsub("3","c") gsub("4","d") gsub("5","e") gsub("6","f") gsub("6","g") gsub("7","h") gsub("7","h") gsub("8","i") gsub("9","j"); print}')
hashprint "Machine ID: $id"

status_code=$(curl --write-out %{http_code} --silent --output /dev/null https://extregg-api.tringlle.repl.co/api/$id/title)
if [[ "$status_code" == 404 ]]
then
    title="ExtrEgg"
else
    title=$(curl -s https://extregg-api.tringlle.repl.co/api/$id/title)
fi


logo=$(toilet "$title" -F gay -F border)
echo "$logo - By ExperimentalX: https://github.com/Experimentali"


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
