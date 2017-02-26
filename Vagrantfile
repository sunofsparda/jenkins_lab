# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

# http://www.thisprogrammingthing.com/2015/multiple-vagrant-vms-in-one-vagrantfile/

  config.vm.define "default" do |config|
    config.vm.box = "geerlingguy/centos7"
    config.vm.hostname = "epbyminw2473t144.minsk.epam.com"
    config.vm.network "forwarded_port", guest: 80, host: 10080
    config.vm.network "forwarded_port", guest: 8080, host: 18080
    config.vm.network "forwarded_port", guest: 9090, host: 19090 
    config.vm.network "public_network"
    config.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end
  end

  config.vm.define "jenkins-test" do |jenkins|
    jenkins.vm.box = "geerlingguy/centos7"
    jenkins.vm.hostname = "epbyminw2473t1jenkins.minsk.epam.com"
    jenkins.vm.network "private_network", type: "dhcp"
    jenkins.vm.provider :virtualbox do |vb|
      vb.memory = "2048"
    end
  end

  config.vm.define "jenkins-master0" do |jenkins_m0|
    jenkins_m0.vm.box = "geerlingguy/centos7"
    jenkins_m0.vm.hostname = "epbyminw2473t00jmaster0.minsk.epam.com"
    jenkins_m0.vm.network "private_network", type: "dhcp"
    jenkins_m0.vm.network "forwarded_port", guest: 8080, host: 28080
    jenkins_m0.vm.provider :virtualbox do |vb|
     vb.memory = "2048"
    end
  end

  config.vm.define "jenkins-slave0" do |jenkins_s0|
    jenkins_s0.vm.box = "geerlingguy/centos7"
    jenkins_s0.vm.hostname = "epbyminw2473t10jslave0.minsk.epam.com"
    jenkins_s0.vm.network "private_network", type: "dhcp"
    jenkins_s0.vm.provider :virtualbox do |vb|
      vb.memory = "2048"
    end
  end  

  config.vm.define "jenkins-slave1" do |jenkins_s1|
    jenkins_s1.vm.box = "geerlingguy/centos7"
    jenkins_s1.vm.hostname = "epbyminw2473t11jslave1.minsk.epam.com"
    jenkins_s1.vm.network "private_network", type: "dhcp"
    jenkins_s1.vm.provider :virtualbox do |vb|
      vb.memory = "2048"
    end
  end

 config.vm.provision "shell", path: "install/jenkins/init_jenkins.sh"
 
end
