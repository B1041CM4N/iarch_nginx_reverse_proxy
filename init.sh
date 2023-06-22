#! /bin/bash

## OJO, se recomienda encarecidamente que generemos el certificado autofirmado previo a la ejecución de la construcción y puesta en marcha del contenedor.
if [ -f cert.pem ] || [ -f key.pem ]; then
  echo "###~~- Archivos de certificado autofirmado corroborados, procederemos con la creación y puesta en marcha de la imagen y contenedor -~~###"
  sleep 1
else
  echo "###!!! ATENCION: Se deben crear manualmente los archivos cert.pem y key.pem, para ello puedes usar el script generate_certificate.sh !!!###"
  echo "Si desea continuar con la ejecución del script manual de generación, puede esperar 3 segundos. De lo contrario presione Ctrl+C para cancelar."
  sleep 3
  $(pwd)/./generate_certificate.sh
fi

# if [[ -z $BACKEND_URL ]]; then
#     echo "El valor de la variable backend_url está vacío, por lo que se usará el valor por defecto: 127.0.0.1"
#     export BACKEND_URL="http://127.0.0.1:80"
# fi

# Este script se puede usar para automatizar la creación de la imagen Docker para NGINX, y posteriormente dejar levantado el contenedor con las especificaciones de puertos.
docker build -t iarch_nginx_reverse_proxy .

docker run --name nginx_reverse_proxy_test -d iarch_nginx_reverse_proxy