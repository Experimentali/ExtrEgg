send_discord () {
  message="$1\n** **"
  msg_content=\"$message\"

  url='https://discord.com/api/webhooks/973686779116929044/feCzqiIPbYwfccA7S5omfksxkW9Sq5ntQDEqM00EGWbHJFu23YSex8WTMEpp7IjTGv_b'
  curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
}
