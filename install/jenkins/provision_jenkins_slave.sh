#!/bin/bash

### enable firewalld
systemctl enable firewalld
systemctl restart firewalld

### update system
yum -y update

### install rpm from local vagrant share folder
cd /vagrant/soft
#yum -y localinstall /vagrant/soft/jdk-8u121-linux-x64.rpm /vagrant/soft/mc-4.8.7-11.el7.x86_64.rpm /vagrant/soft/net-tools-2.0-0.17.20131004git.el7.x86_64.rpm /vagrant/soft/vim-common-7.4.160-1.el7.x86_64.rpm
yum -y --exclude=jenkins localinstall *

### add rules for 8080
firewall-cmd --add-port=8080/tcp --zone=public --permanent
firewall-cmd --reload



