#!/usr/bin/env bash

NGINX_CONTAINER=nginx-task3
if [ ! -z $(docker ps -a -f "name=$NGINX_CONTAINER" --format "{{ .ID }}") ]; then
  docker rm -f $NGINX_CONTAINER 
fi

NGINX_IMAGE=nginx-task3
docker run -d -ti \
  --cpus 1 \
  --name $NGINX_CONTAINER \
  -v "./sites:/sites" \
  -v "./certs:/certs" \
  -v "./configs/main.nginx.conf:/etc/nginx/nginx.conf" \
  -p "5050:443" \
  $NGINX_IMAGE

