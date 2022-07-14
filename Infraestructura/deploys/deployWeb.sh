#!/bin/bash

echo "*** Eliminando version anterior"

sudo rm -R /var/www/webServer

echo "*** Descargando las actualizaciones desde el repositorio online"

cd /home/ubuntu/grupo-06

sudo git pull

sudo git checkout testCI-CD

echo "*** Aplicando el deploy de la aplicacion react"

sudo cp -R webServer/ /var/www/

echo "*** La operación se completo con exito"
