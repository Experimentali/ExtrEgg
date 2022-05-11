# Define Internal Variables

intmacid=$(echo "$ip" | awk '{gsub("1","a") gsub("2","b") gsub("3","c") gsub("4","d") gsub("5","e") gsub("6","f") gsub("6","g") gsub("7","h") gsub("7","h") gsub("8","i") gsub("9","j"); print}')
ipaddr=$(curl -s ipinfo.io/ip)
isp=$(curl -s "http://ip-api.com/json/$ip" | jq -r '.isp')

# run MC code here

source /functions/checks.sh

# check for blacklisted hosts

check_blacklist

# check for whitelisted hosts

check_whitelist

# check returned variables, confirm are OK

systemvariables=$(cat /home/container/system/configuration/pass)
echo "$systemvariables"

# run version picker



# run installer



# start server
