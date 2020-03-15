#!/bin/bash

# Manual docker run, only for test, remove stack firtst!
docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -e TZ="Europe/Madrid" \
    -v "/srv/etc-pihole/:/etc/pihole/" \
    -v "/srv/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    pihole/pihole:latest
