#!/bin/bash

URL=$1;

################################################################################
#
# Creo el archivo de configuración de NGINX 

echo -e "Creo el archivo de configuración de NGINX"

cd /etc/nginx/sites-available/

cp modelo.int $URL.int

sed -i 's/@URL@/'$URL'/g' "$URL.int"

echo -e "| \n\-> OK \n\n"

################################################################################
#
# Creo el enlace simbolico

echo -e "Creo el enlace simbolico"

cd /etc/nginx/sites-enabled

ln -s /etc/nginx/sites-available/$URL.int /etc/nginx/sites-enabled/$URL.int.conf

echo -e "| \n\-> OK \n\n"

################################################################################
#
# Creo el directorio en /var/www

echo -e "Creo el directorio en /var/www"

mkdir -p /var/www/$URL.int/public
mkdir -p /var/www/$URL.int/log

echo "<h3>/var/www/"$URL".int/public</h3>" > /var/www/$URL.int/public/index.php

chown -R www-data:www-data /var/www/$URL.int

echo -e "| \n\-> OK \n\n"

################################################################################
#
# Lo agrego en el archivo hosts

echo -e "Lo agrego en el archivo hosts"

sed -i 's/#@URL@/127.0.0.1  '$URL'.int \n#@URL@/g' "/etc/hosts"

echo -e "| \n\-> OK \n\n"

################################################################################
#
# Reinicio NGINX

echo -e "Reinicio NGINX"

systemctl reload nginx.service

echo -e "| \n\-> OK \n\n\n URL creada: $URL.int"