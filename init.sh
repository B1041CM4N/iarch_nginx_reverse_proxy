#! /bin/bash

## OJO, se recomienda encarecidamente que generemos el certificado autofirmado previo a la ejecución de la construcción y puesta en marcha del contenedor.
if [ -f cert.pem ] || [ -f key.pem ]; then
  echo "Archivos de certificado autofirmado corroborados, procederemos con la creación y puesta en marcha de la imagen y contenedor"
else
  echo "Se deben crear manualmente los archivos cert.pem y key.pem, para ello puedes usar el script generate_certificate.sh"
  $(pwd)/./generate_certificate.sh
fi

# Este script se puede usar para automatizar la creación de la imagen Docker para NGINX, y posteriormente dejar levantado el contenedor con las especificaciones de puertos.
docker build -t iarch_nginx_reverse_proxy .

if [ -n $BACKEND_URL ]; then
    echo "El valor de la variable backend_url está vacío, por lo que se usará el valor por defecto: http://localhost"
    export BACKEND_URL="http://localhost"
    export backend_url="http://localhost"
fi

#docker run -p 80:80 -p 443:443 -e "backend_url='http://localhost'" -d iarch_nginx_reverse_proxy
docker run -d iarch_nginx_reverse_proxy
