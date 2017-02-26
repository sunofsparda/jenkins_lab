#!/bin/bash

### enable firewalld
systemctl enable firewalld
systemctl restart firewalld

### update system
yum -y update

### add jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

### install rpm from local vagrant share folder
cd /vagrant/soft
yum localinstall -y *
#yum -y localinstall /vagrant/soft/jdk-8u121-linux-x64.rpm /vagrant/soft/mc-4.8.7-11.el7.x86_64.rpm /vagrant/soft/net-tools-2.0-0.17.20131004git.el7.x86_64.rpm /vagrant/soft/vim-common-7.4.160-1.el7.x86_64.rpm

### add rules for 8080
firewall-cmd --add-port=8080/tcp --zone=public --permanent
firewall-cmd --reload

### Enable and start jenkins
systemctl enable jenkins
systemctl restart jenkins


### Generate ssh keys
#sudo -u jenkins ssh-keygen
#rm /var/lib/jenkins/.ssh/*
#sudo -u ssh-keygen -f "/var/lib/jenkins/.ssh/id_rsa_project" # -N ""


### Add pub key to auth_keys

#cp /var/lib/jenkins/.ssh/id_rsa_project.pub /vagrant/install/jenkins/id_rsa_project.pub
#cat /vagrant/install/jenkins/id_rsa_project.pub >> /var/lib/jenkins/.ssh/authorized_keys
#chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
#chmod 600 /var/lib/jenkins/.ssh/authorized_keys


##################################### NOT WORKING #################################################################################
#sudo echo 1 >> /var/lib/jenkins/.ssh/authorized_keys
#echo "cat /vagrant/install/jenkins/id_rsa_project.pub >> /var/lib/jenkins/.ssh/authorized_keys" | sudo -u jenkins
#runuser -l jenkins -c 'cat /vagrant/install/jenkins/id_rsa_project.pub >> /var/lib/jenkins/.ssh/authorized_keys'

### The problem is that the shell does output redirection, not sudo or echo, so this is being done as your regular user.
### Try the following code snippet:
#sudo sh -c "echo 'something' >> /etc/privilegedfile"

### Using tee:
#echo 'deb blah ... blah' | sudo tee --append /etc/apt/sources.list
### Make sure to avoid quotes inside quotes.

### To avoid printing data back to the console:
#echo 'deb blah ... blah' | sudo tee --append /etc/apt/sources.list > /dev/null
######################################################################################################################

