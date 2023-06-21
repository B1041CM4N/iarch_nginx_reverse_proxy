FROM nginx

# Pasamos como argumento la variable BACKEND_URL (Pre-definida como variable de ambiente)
# Para definirla podemos usar export BACKEND_URL="http://ejemplo.cl:80"
## OJO: usando el archivo init.sh podemos pasar el valor de variable con la opción -e en caso de que nos sea más cómodo.
ENV BACKEND_URL="$(echo $BACKEND_URL)"

# Usando el archivo nginx.conf que armamos, lo copiamos para pasar las configuraciones al contenedor
COPY nginx.conf /etc/nginx/nginx.conf

# Exponemos los puertos 80 y 443 para habilitar que el server NGINX responda
EXPOSE 80
EXPOSE 443

# Iniciamos NGINX al ejecutar con el siguiente CMD
CMD ["nginx", "-g", "daemon off;"]