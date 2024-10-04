FROM nginx:latest

COPY ./nginroot /usr/share/nginx/nginroot

COPY ./nginx.conf /etc/nginx/nginx.conf