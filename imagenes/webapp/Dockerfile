FROM docker.io/library/nginx:alpine

# Copiamos el contenido web
COPY index.html /usr/share/nginx/html/index.html

# Copiamos certificado y clave autofirmados
COPY nginx.crt /etc/nginx/nginx.crt
COPY nginx.key /etc/nginx/nginx.key

# Instalamos utilidades necesarias para htpasswd
RUN apk add --no-cache apache2-utils

# Creamos el archivo htpasswd con usuario y contraseña
RUN htpasswd -bc /etc/nginx/.htpasswd user1 pass123

# Sustituimos la configuración de nginx para usar HTTPS y autenticación básica
RUN echo 'server {\n\
    listen 443 ssl;\n\
    ssl_certificate /etc/nginx/nginx.crt;\n\
    ssl_certificate_key /etc/nginx/nginx.key;\n\
\n\
    location / {\n\
        auth_basic "Restricted";\n\
        auth_basic_user_file /etc/nginx/.htpasswd;\n\
        root /usr/share/nginx/html;\n\
        index index.html;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

# Exponemos el puerto 443 para HTTPS
EXPOSE 443
