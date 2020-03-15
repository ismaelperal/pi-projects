#!bin/bash

apt update

curl -fsSL https://get.docker.com | bash
usermod -aG docker root

docker swarm init
docker network create -d overlay proxy
docker stack deploy -c traefik.yaml traefik
docker stack deploy -c pihole.yaml pihole
