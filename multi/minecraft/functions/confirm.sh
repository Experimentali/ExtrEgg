pof="$(cat /home/container/system/configuration/pass.txt)"

echo_sf () {
  if [[ "$pof" == "YES" ]]
  then
    echo "$(tput setaf 3)$(tput bold)SUCCESS$(tput sgr 0) $(tput setaf 3)You have passed the ISP check."
  elif [[ "$pof" == "NO" ]]
  then
    echo "$(tput setaf 2)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 2)You have failed the ISP check."
  else
    echo "$(tput setaf 2)$(tput bold)FAILURE$(tput sgr 0) $(tput setaf 2)An error has occured. Please report this to the Developers of ExtrEgg."
  fi
}
