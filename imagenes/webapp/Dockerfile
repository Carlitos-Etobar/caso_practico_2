FROM docker.io/library/nginx:alpine

# Copiamos el contenido web
COPY index.html /usr/share/nginx/html/index.html

# Añadimos autenticación básica
RUN apk add --no-cache apache2-utils && \
    htpasswd -bc /etc/nginx/.htpasswd user1 pass123

# Sustituimos la config de nginx por una que use autenticación
RUN echo 'server {\n\
    listen 80;\n\
    location / {\n\
        auth_basic "Restricted";\n\
        auth_basic_user_file /etc/nginx/.htpasswd;\n\
        root /usr/share/nginx/html;\n\
        index index.html;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf
