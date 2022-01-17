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

sudo apt-get install libffi-dev || error "Failed to install libffi-dev!"
sudo apt-get install libssl-dev || error "Failed to install libssl-dev!"
sudo apt install python3-dev || error "Failed to install python3-dev!"
sudo apt-get install -y python3 || error "Failed to install python3!"
sudo apt-get install -y python3-pip || error "Failed to install python3-pip!"

sudo pip3 install docker-compose || error "Failde to install docker-compose!"
