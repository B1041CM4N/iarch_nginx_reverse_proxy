#! /bin/bash

# Este script se puede usar para automatizar la creación de la imagen Docker para NGINX, y posteriormente dejar levantado el contenedor con las especificaciones de puertos.
docker build -t iarch_nginx_reverse_proxy .
docker run -p 80:80 -p 443:443 -e "BACKEND_URL=http://localhost:80" -d iarch_nginx_reverse_proxy