#!/bin/bash

docker run --rm -d --name=wireguard --cap-add=NET_ADMIN --cap-add=SYS_MODULE -e PUID=1000 -e PGID=1000 -e TZ=Europe/Madrid -e SERVERURL=gea.ismaelperal.com  -e SERVERPORT=51820  -e PEERS=1  -e PEERDNS=192.168.25.254  -e INTERNAL_SUBNET=10.25.25.0  -p 51820:51820/udp -v /srv/etc-wireguard:/config -v /lib/modules:/lib/modules --sysctl="net.ipv4.conf.all.src_valid_mark=1" linuxserver/wireguard
