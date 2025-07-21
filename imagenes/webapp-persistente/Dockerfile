FROM docker.io/library/nginx:alpine

# Copiamos el contenido web
COPY index.html /usr/share/nginx/html/index.html

# Copiamos certificado y clave autofirmados
COPY nginx.crt /etc/nginx/nginx.crt
COPY nginx.key /etc/nginx/nginx.key

# Copiamos configuración de nginx lista
COPY default.conf /etc/nginx/conf.d/default.conf

# Copiamos contenido inicial destinado al volumen persistente
COPY images /usr/share/nginx/html/images

# Instalamos utilidades necesarias para htpasswd
RUN apk add --no-cache apache2-utils

# Creamos el archivo htpasswd con usuario y contraseña
RUN htpasswd -bc /etc/nginx/.htpasswd user1 pass123

# Exponemos el puerto 443 para HTTPS
EXPOSE 443
