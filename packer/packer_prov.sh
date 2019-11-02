#!/bin/bash
#sudo yum update -y
# Install dependent packages
sudo yum install git httpd wget unzip java-1.8.0-openjdk yum-utils -y
# Test Apache
echo "Automation for the people" | sudo tee /var/www/html/index.html
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
# Install Packer to provision Golden Image in future
wget https://releases.hashicorp.com/packer/1.4.4/packer_1.4.4_linux_amd64.zip
sudo unzip -d /usr/local/bin packer_1.4.4_linux_amd64.zip
sudo ln -s /usr/local/bin/packer /usr/local/bin/packer.io
rm packer_1.4.4_linux_amd64.zip
packer.io version
# Copy packer builder and provisioner files to packer directory with file module
#mkdir ~/packer_proj
#cp /path_to_file.json_and.sh ~/packer_proj

#Install Terraform
wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
sudo unzip -d /usr/local/bin terraform_0.12.12_linux_amd64.zip
export PATH=/usr/local/bin:$PATH
source .bash_profile
rm terraform_0.12.12_linux_amd64.zip

#Install Ansible
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install ansible -y
