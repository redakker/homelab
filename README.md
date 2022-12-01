# homelab
My home lab in Docker

Separated services which are used in my home lab.

You can use it as it is, however some passwords in the config need to be changed.
The structure planned for a home environment, because services are not secure.

Nginx Proxy Manager does the security only from the outside.

Your router should allow two ports from outside/web (80,443) and Nginx Proxy Manager should do the translation for the inside services.
That is the way how to use https for the inside services.

## How to start
- install docker and docker-compose to the host machine
- clone this repository to one of the folders
- add execute role to the generate.sh (chmod +x generate.sh) -> start.sh is created
- run start.sh -> wait till all container is up

## Services

- cron
- database (mysql)
  - port: 3306
- adminer (mysql admin frontend)
  - port: 9080
- esphome
  - port: 6052
- fail2ban
  - port: host
- fauxmo
  - port: host
- heimdall
  - port: 8086
- homeassistant
  - port: 8123
- mosquitto
  - port: 1883, 8883
- motioneye
  - port: 8765
- nextcloud
  - port: 8888
- nginx
  - port: 8085
- php
  - port: 9000
- node-exporter
  - port: 9100
- portainer
  - port: 9000
- prometheus
  - port: 9090
- grafana
  - port: 3000
- proxy-manager
  - port: 80, 443, 81
- samba
  - port: 135, 137, 138, 139, 445
- traccar
  - port: 8082, 500-5150
- transmission
  - port: 9091, 51413
- uptime-kuma:
  - port: 3001

 
