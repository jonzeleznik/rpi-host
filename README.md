# rpi-hosted

## Table of content
- [rpi-hosted](#rpi-hosted)
  - [Table of content](#table-of-content)
  - [About](#about)
  - [Note](#note)
  - [Repo Content](#repo-content)
    - [compose](#compose)
    - [config](#config)
    - [icons](#icons)
    - [install scripts](#install-scripts)

## About
Repository for hosted docker-compose files, icons for Homer dashboard and install scripts.

## Note
**This was all used for Raspberry pi 4GB self-hosting!**

## Repo Content
### [compose](./compose/)
Docker-compose files that host  
You can run them by first changing(`cd`) to wanted director.  
For example: 
```bash
cd Homer/
```
Than you can just deploy docker-compose file:
```bash
sudo docker-compose up -d
```
+ [Duplicati](./compose/Duplicati/)
  + **Image** - lscr.io/linuxserver/duplicati
+ [Homer](./compose/Homer/)
  + **Image** - b4bz/homer:latest
+ [Jellyfin](./compose/Jellyfin/)
  + **Image** - lscr.io/linuxserver/jellyfin
+ [Nginx](./compose/Nginx/)
  + **Image** - jc21/nginx-proxy-manager:latest
+ [Syncthing](./compose/Syncthing/)
  + **Image** - lscr.io/linuxserver/syncthing
+ [Wireguard-easy](./compose/Wireguard-easy/)
  + **Image** - weejewel/wg-easy
+ [Transmission](./compose/Transmission/)
  + **Image** - lscr.io/linuxserver/transmission

### [config](./config/)
Configuration files for docker containers

### [icons](./icons/)
Icons that I use for my Homer dashboard

### [install scripts](./install_scripts/)
Install scripts for helping install certen tools:
+ **Docker-compose**
+ **Docker**
+ **Nginx**
+ **Portainer**
