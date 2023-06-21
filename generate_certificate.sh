#! /bin/bash

# Ejecutar el siguiente comando para generar el certificado y la llave autofirmados (Son los que usará NGINX)
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out cert.pem