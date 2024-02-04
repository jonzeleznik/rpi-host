#!/bin/bash

data_folder="/home/pi/rpi-host/scripts/"

source $data_folder.env

error=false
error_msgs=()

# --- update system ---
if sudo apt update && sudo apt upgrade -y 
then
    error_msgs+=("")
else
    error=true
    error_msgs+=("Something went wrong when updating sys")
fi

# --- check for ip change ---
if ! test -f $data_folder.ip; then
  touch $data_folder.ip
  echo $current_ip > $data_folder.ip
fi

current_ip=$(curl ipinfo.io/ip)
prev_ip=$(cat $data_folder.ip)

if [[ "$current_ip" != "$prev_ip" ]]
then
	echo $current_ip > $data_folder.ip
  error=true
  error_msgs+=("Your public IP has changed!")
fi

# --- check docker container status ---
containers=$(docker ps -a --format "{{.ID}}")

sep='-'
declare -a container_info=()

if [ -z "$containers" ]
then
  echo "No Docker containers found."
else
  for container_id in $containers
  do
    container_status=$(docker inspect -f '{{.State.Status}}' "$container_id")

    if [ $container_status == "exited" ]
    then
      container_name=$(docker inspect -f '{{.Name}}' "$container_id" | sed 's/\///')
      container_info+=("${container_name}")
    fi
  done
fi

docker=""
for i in "${!container_info[@]}"
do
  docker+=$(printf '%s | ' "${container_info[$i]}")
done


# --- check for errors ---
if $error 
then
    msg=$(printf "|%s|" "${error_msgs[@]}")
    curl -u "$NTFY_USER":"$NTFY_PASSWORD" -H "Tags: x" -H "At: 7am" -H "Title: Error" -d "$msg
    Docker Containers
    $docker" https://rem.cargoesbrrr.com/alerts
else
    curl -u "$NTFY_USER":"$NTFY_PASSWORD" -H "Tags: heavy_check_mark" -H "At: 7am" -H "Title: Successful" -d "Sys updated
    Docker Containers
    $docker" https://rem.cargoesbrrr.com/alerts
fi  