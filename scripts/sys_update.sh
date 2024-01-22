#!/bin/bash
source .env

sudo apt update && sudo apt upgrade -y \
&& curl -H "Tags: heavy_check_mark" -H "Title: Successful" -u racunalnicec:trolololo -d "Sys updated" https://rem.cargoesbrrr.com/alerts \
|| curl -H "Tags: x" -u "$NTFY_USER":"$NTFY_PASSWORD" -H "Title: Error" -d "Something went wrong when updating sys" https://rem.cargoesbrrr.com/alerts
