send_discord () {
  message="$1\n** **"
  msg_content=\"$message\"

  url='$2'
  curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
}
