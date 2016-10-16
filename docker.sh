#!/bin/bash

# Installation de la dernière version de Docker

printf "Installation de la dernière version de Docker...\n"
printf "L'insertion de votre mot de passe vous sera demandée.\n\n"

OS="ubuntu-xenial"

case "$1" in
    "trusty")
        printf "\n--> configuration pour Ubuntu 14.04 Trusty"
        $OS = "ubuntu-trusty"
        ;;
    "xenial")
        printf "\n--> configuration pour Ubuntu 16.04 Xenial"
        $OS = "ubuntu-xenial"
        ;;
    "")
        printf "\n--> [DEFAUT] configuration pour Ubuntu 16.04 Xenial"
        $OS = "ubuntu-xenial"
        ;;
    *)
        printf "\nl'OS spécifié n'est pas reconnu, merci d'indiquer l'un des OS suivant : trusty ou xenial.\nSi aucun n'est indiqué, xenial sera utilisé par défaut.\n"
        printf "\nusage: `basename ${0}` [trusty|xenial]\n"
        exit
        ;;
esac

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates

printf "\nRécupération de la clé publique dédiée à Docker...\n\n"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Ajout du package repository
printf "\nAjout du package repository pour '$OS'\n\n"
sudo touch /etc/apt/sources.list.d/docker.list
printf "deb https://apt.dockerproject.org/repo $OS main" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get purge lxc-docker

apt-cache policy docker-engine

# Installation de l'image étendue de l'OS
printf "\nInstallation de l'image étendue de l'OS...\n\n"
sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r)

# Installation de Docker Engine
printf "\nInstallation de Docker Engine...\n\n"
sudo apt-get update
sudo apt-get install -y docker-engine

# Installation de Docker Engine
printf "\nInitilialisation du service...\n\n"
sudo service docker start

# Test du fonctionnement de Docker
printf "\nTest du fonctionnement de Docker...\n\n"
sudo docker run hello-world

# Ajout de la permission d'utiliser Docker à l'utilisateur courant
printf "\nAjout de la permission d'utiliser Docker à l'utilisateur courant...\n\n"
sudo groupadd docker
sudo usermod -aG docker $USER
printf "Il faudra vous déconnecter puis vous reconnecter pour que les modifications prennent effet.\n"

printf "\nInstallation de Docker s'est terminée avec succès !\n"
