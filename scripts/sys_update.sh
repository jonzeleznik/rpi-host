#!/bin/bash
source .env

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
current_ip=$(curl ipinfo.io/ip)
prev_ip=$(cat /home/pi/rpi-host/scripts/.ip)

if [[ "$current_ip" != "$prev_ip" ]]
then
	echo $current_ip > .ip
    error=true
    error_msgs+=("Your public IP has changed!")
fi

# TODO: docker container status

# --- check for errors ---
if $error 
then
    msg=$(printf "|%s|" "${error_msgs[@]}")
    curl -H "Tags: x" -u "$NTFY_USER":"$NTFY_PASSWORD" -H "At: 7am" -H "Title: Error" -d "$msg" https://rem.cargoesbrrr.com/alerts
else
    curl -H "Tags: heavy_check_mark" -H "At: 7am" -H "Title: Successful" -u "$NTFY_USER":"$NTFY_PASSWORD" -d "Sys updated" https://rem.cargoesbrrr.com/alerts
fi
