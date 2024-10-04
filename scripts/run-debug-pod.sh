#!/usr/bin/env bash

NGINX_CONTAINER=nginx_docker
if [ ! -z $(docker ps -a -f "name=$NGINX_CONTAINER" --format "{{ .ID }}") ]; then
  docker rm -f $NGINX_CONTAINER 
fi

docker run -d -ti --cpus 1 --name $NGINX_CONTAINER -v "./sites:/sites" -v "./configs/main.nginx.conf:/etc/nginx/nginx.conf" -v "./certs:/certs"  -p "5050:443" nginx

