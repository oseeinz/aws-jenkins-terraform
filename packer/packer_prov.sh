#!/bin/bash
#sudo yum update -y
# Install dependent packages
sudo yum install httpd java-1.8.0-openjdk yum-utils -y
# Test Apache
echo "Automation for the people" | sudo tee /var/www/html/index.html
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

#Install Ansible
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install ansible -y
