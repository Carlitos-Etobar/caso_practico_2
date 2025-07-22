# Imagen PHP con Apache para servir contenido externo
FROM docker.io/library/php:8.1-apache

# Crear carpeta para los archivos subidos
RUN mkdir -p /var/www/html/data && chown www-data:www-data /var/www/html/data

# Copiar el código fuente
COPY html/ /var/www/html/

# Exponemos el puerto 80 dado que no usamos https
EXPOSE 80
