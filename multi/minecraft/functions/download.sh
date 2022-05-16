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
}

download_velocity () {
  curl -so /home/container/server.jar "https://serverjars.com/api/fetchJar/velocity/3.1.2"
}
