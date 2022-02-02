#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

sudo mkdir /portainer/Files/AppData/Config/library/Nginx || error "Failed to create folder!"
sudo cp ../config/nginx/config.json /portainer/Files/AppData/Config/library/Nginx/ || error "Failed to copy config.json!"

sudo docker-compose up -d
