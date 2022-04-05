<h1 style="text-align: center; font-size: 50px;">rpi-hosted</h1>

## About
Repository for hosted docker-compose files, icons for Homer dashboard and install scripts.      

![alt text](https://i.imgur.com/ObARmzE.png)

## Note
**This was all used on Raspberry pi 4GB self-hosting!**


## Table of content
- [About](#about)
- [Note](#note)
- [Table of content](#table-of-content)
- [Containers](#containers)
  - [**Authelia**](#authelia)
  - [**Duplicati**](#duplicati)
  - [**Focalboard**](#focalboard)
  - [**Homer**](#homer)
  - [**Jellyfin**](#jellyfin)
  - [**Nginx Proxy Manager**](#nginx-proxy-manager)
  - [**Syncthing**](#syncthing)
  - [**Transmission**](#transmission)


## Containers
How to deploy each container.

### **Authelia**
Authelia is an open-source server providing a login portal and treating authentication requests in cooperation with NGINX  
PORT = 9091

For setup guide watch DB Tech [video](https://www.youtube.com/watch?v=4UKOh3ssQSU)

### **Duplicati**
Duplicati is a free backup software to store encrypted backups online.    
PORT = 8200

1. CD to `compose/Duplicati`
```
cd compose/Duplicati
```
2. Deploy the container
```
sudo docker-compose up -d
```
3. Go to `your-ip:8200` and follow the setup guide.

### **Focalboard**
Foacalboard is an open-source note taking alternative for Notion.   
PORT = 22300

***This Dockefile was made by [nicoulaj](https://github.com/nicoulaj).***  
For easier deployment I made a [BASH script](install_scripts/focalboard_setup.sh).

### **Homer**
Homer is a dead simple static HOMepage for your servER to keep your services on hand.
PORT = 5005

1. CD to `compose/Homer`
```
cd compose/Homer
```
2. Deploy the container
```
sudo docker-compose up -d
```
3. Go to `your-ip:5005`
4. For configuring you must go to `/portainer/Files/AppData/Config/library/Homer/config.yml`

### **Jellyfin**
Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.   
PORT = 8096

1. CD to `compose/Jellyfin`
```
cd compose/Jellyfin
```
2. Deploy the container
```
sudo docker-compose up -d
```
3. Go to `your-ip:8096` and follow the setup guide.

### **Nginx Proxy Manager**
NGINX proxy manager is a reverse proxy management system, that is based on NGINX with a nice and clean web UI.  
PORT=81   
For easier deployment I made a [BASH script](install_scripts/nginx_setup.sh).

### **Syncthing**
Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes.    
PORT = 8384     

1. CD to `compose/Syncthing`
```
cd compose/Syncthing
```
2. Deploy the container
```
sudo docker-compose up -d
```
3. Go to `your-ip:8384` and follow setup guide.

### **Transmission**
Transmission is an open source BitTorrent client.     
PORT = 9099     

1. CD to `compose/Transmission`
```
cd compose/Transmission
```
2. Configure location of the `\Downloads` folder (where all files will be downloaded) in [compose file](compose/Transmission/docker-compose.yml)
2. Deploy the container
```
sudo docker-compose up -d
```
3. Go to `your-ip:9099` 
