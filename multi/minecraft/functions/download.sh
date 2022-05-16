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
