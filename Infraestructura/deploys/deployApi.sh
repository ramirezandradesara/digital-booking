#!/bin/bash

echo "*-*-*-*-*-*-*"
echo "Se obtienen las actualizaciones desde el repositorio"
echo "*-*-*-*-*-*-*"

cd /home/ubuntu/repo/grupo-06

sudo git pull

sudo git checkout testCI-CD

cd 'Back end'/digitalbooking/

echo "*-*-*-*-*-*-*"
echo "Se crea el archivo ejecutable java usando maven"
echo "*-*-*-*-*-*-*"

sudo mvn clean

sudo mvn package

cd target/

ls

echo "*-*-*-*-*-*-*"
echo "Se inicia el ejecutable en segundo plano usando nohup"
echo "*-*-*-*-*-*-*"

nohup java -jar digitalbooking-0.0.1-SNAPSHOT.jar &
echo "nohup ejecutado"

echo "*-*-*-*-*-*-*"
echo "¡El servidor api ya quedó actualizado!"
echo "*-*-*-*-*-*-*"
