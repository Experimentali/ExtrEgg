#!/bin/bash

download_vanilla () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/vanilla/$1"
}

download_spigot () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/spigot/$1"

}

download_paper () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/paper/$1"

}

download_purpur () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/purpur/$1"

}

download_waterfall () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/waterfall/1.18"
  mkdir -p /home/container/plugins
  curl -so /home/container/plugins/88636.jar "https://api.spiget.org/v2/resources/88636/download"
}

download_velocity () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/velocity/3.1.2"
}

download_nukkitx () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/nukkitx/1.16"
}

download_pocketmine () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/pocketmine/4.3.2"
} 
