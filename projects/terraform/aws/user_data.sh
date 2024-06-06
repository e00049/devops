#!/usr/bin/env bash

sudo useradd -s /bin/bash -d /home/e00049 -m e00049
echo -e "zippyops\nzippyops" | sudo passwd e00049 > /dev/null 2>&1
echo "e00049 ALL=(ALL)      NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config
sudo service sshd restart >/dev/null 2>&1

sudo yum update -y
sudo yum install httpd -y 

echo "apache installation sucessfully" > /tmp/apche-installation.txt