#!/bin/bash
echo "Instalando dependencias!" >> /home/gmap/install.log
cat ./packages | xargs apt-get install -y

echo "Dependencias instaladas" >> /home/gmap/install.log
service ssh start

echo "Mantendo container em execução" >> /home/gmap/install.log
tail -f /dev/null