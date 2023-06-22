FROM nginx

# Pasamos como argumento la variable BACKEND_URL (Pre-definida como variable de ambiente)
# Para definirla podemos usar export BACKEND_URL="ejemplo.cl"
## OJO: usando el archivo init.sh podemos pasar el valor de variable con la opción -e en caso de que nos sea más cómodo.
ARG BACKEND_URL="http://127.0.0.1:80"
ENV backend_url=$BACKEND_URL

# Usando el archivo nginx.conf que armamos, lo copiamos para pasar las configuraciones al contenedor
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/templates/default.conf.template

# Copiamos los certificados autofirmados
#### OJO, generar usando el script generate_certificate.sh y completar con los datos que se van pidiendo ###
COPY cert.pem /etc/nginx/ssl/cert.pem
COPY key.pem /etc/nginx/ssl/key.pem

# Exponemos los puertos 80 y 443 para habilitar que el server NGINX responda
EXPOSE 80 443

# Iniciamos NGINX al ejecutar con el siguiente CMD
CMD ["nginx", "-g", "daemon off;"]