#!/bin/env bash

set -e


/vagrant/provision/add-docker-repo.bash

echo "Updating package lists.."
#yum update -y -q

echo "Installing packages..."
yum install -y -q \
    docker-engine \
    git \
    java-1.8.0-openjdk-devel \
    maven 
yum clean all

echo "Configuring aliases..."
echo "alias g=git" >> ~vagrant/.bashrc
echo "alias v=vagrant" >> ~vagrant/.bashrc
echo "alias d=docker" >> ~vagrant/.bashrc

echo "Adding docker user&group..."
groupadd docker
usermod -aG docker vagrant

echo "Running docker..."
systemctl enable  docker.service
systemctl start  docker.service

