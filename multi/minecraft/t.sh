# Define Internal Variables

intmacid=$(echo "$ip" | awk '{gsub("1","a") gsub("2","b") gsub("3","c") gsub("4","d") gsub("5","e") gsub("6","f") gsub("6","g") gsub("7","h") gsub("7","h") gsub("8","i") gsub("9","j"); print}')
ipaddr=$(curl -s ipinfo.io/ip)
isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')

# run MC code here

source /functions/checks.sh

# Create system configuration files

create_files

# check for blacklisted hosts

check_blacklist

# check for whitelisted hosts

check_whitelist

# Echo variables to file

echo_to_file

# check returned variables, confirm are OK

systemvariables=$(cat /home/container/system/configuration/pass.txt)

# Define new source for new functions

source /functions/confirm.sh

# Print failure or success

echo_sf

# Source version picker

source /functions/version.sh

# run version picker

if [ ! -f /home/container/system/configurations/version.txt ]
then
  group
fi

# run installer

/functions/update_jar.sh

# start server

exec java -Xmx1G -Xms512M -jar /home/container/server.jar 
