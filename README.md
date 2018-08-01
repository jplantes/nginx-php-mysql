# Configuración local NGINX - PHP7.2-fpm - MySQL

## Instalación NGINX

> sudo apt-get install nginx

## Instalación MySQL

> sudo apt-get install mysql-server

## Instalación PHP7.2-fpm

> sudo apt-get install php7.2-fpm php7.2-mysql


## Modificación nginx.conf

Agregar el siguiente contenido al final de la exprexion

```
  http {
    (......)

    ##
    # Virtual Host Configs
    ##

    include /etc/nginx/conf.d/*.conf;
    **include /etc/nginx/sites-enabled/*;**
  }
```

Esta linea levantara los nuevos sitio que vayamos reando

## Modificación hosts

Agrgar al final del archivo hosts la siguientes lineas

> sudo nano /etc/hosts

```
  #############################################
  #
  # Creador por mi Script

  #@URL@
```


## Datos para la configuración de los Scripts

##### 1.- Copiar copiar el archivo "modelo.int" en el siguiente directorio:

> /etc/nginx/sites-available/

##### 2.- Verificar la configuración del archivo "modelo.int"

La información que se encuentra en la linea

fastcgi_pass unix:**/run/php/php7.2-fpm.sock**;

la podemos obtener haciendo un:

> ls -l /run/php/

##### 3.- Ejecución del archivo script.sh

Se debe ejecutar como sudo ya que el bash cambia grupos y permisos en distintos directorios

> sudo bash script.sh my-dominio

solo debemos colocar el nombre de dominio sin .int, este lo agregara el Script




