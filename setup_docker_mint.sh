#!/bin/bash
# Author David Conde
#0.Creamos directorios necesarios
sudo mkdir -p /opt/rdsistemas
sudo chown -R $USER.$USER /opt/rdsistemas
#1.Paso Actualizar el sistema e instalar dependencias
sudo apt-get update -y
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
#2.Instalar firma del repositorio
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#3.Añadir repositorio
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
echo "Se ha añadido el siguiente repositorio:"
cat /etc/apt/sources.list.d/additional-repositories.list 
#4.Actualizar la lista de paquetes con los nuevos repositorios
sudo apt-get update -y
#5.Instalar docker
sudo apt-get -y  install docker-ce docker-compose
#6.Añadir usuario actual al grupo docker para poder ejecutar dockers
sudo usermod -aG docker $USER
#7. Reiniciar el sistema docker
sudo systemctl restart docker
#8.Reboot
while true; do
    read -p "¿Quiere reiniciar el equipo ahora?" sn
    case $sn in
        [Ss]* ) reboot; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor responda si o no.";;
    esac
done
