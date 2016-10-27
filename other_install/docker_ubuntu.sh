#! /bin/bash
sudo apt install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# This needs to changed to the version of ubuntu/debian you are using
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt-cache policy docker-engine

# Only ubuntu
sudo apt update
sudo apt install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt update
sudo apt install docker-engine
sudo service docker start

# group in ubuntu
sudo groupadd docker
sudo usermod -aG docker $USER

# docker-compose
pip install docker-compose
