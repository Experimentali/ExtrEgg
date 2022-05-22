pof="$(cat /home/container/system/configuration/pass.txt)"

echo_sf () {
  if [[ "$pof" == "YES" ]]
  then
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0) $(tput setaf 2)You have passed the IP check."
  elif [[ "$pof" == "NO" ]]
  then
    echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)You have failed the IP check."
    sleep 5;
    exit 1;
  else
    echo "$(tput setaf 1)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 1)An error has occured. Please report this to the Developers of ExtrEgg."
  fi
}
