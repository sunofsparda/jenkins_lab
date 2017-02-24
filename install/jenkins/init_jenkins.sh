#!/bin/bash

#update system
yum update




#add jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#install jenkins from local place
#yum -y localinstall /vagrant/soft/jdk-8u121-linux-x64.rpm
#yum -y localinstall /vagrant/soft/jenkins-2.32.2-1.1.noarch.rpm
#yum -y localinstall /vagrant/soft/net-tools-2.0-0.17.20131004git.el7.x86_64.rpm
cd /vagrant/soft
yum localinstall -y *