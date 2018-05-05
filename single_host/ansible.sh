#! /bin/bash

#install latest ansible
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible 
sudo apt-get update
sudo apt-get install -y ansible

#copy all stuff on cortrol machine
cp -r /vagrant/stuff/ /home/vagrant/
cd /home/vagrant/stuff/ansible

#copy private keys
cp /vagrant/.vagrant/machines/node1/virtualbox/private_key node1.key
cp /vagrant/.vagrant/machines/node2/virtualbox/private_key node2.key
cp /vagrant/.vagrant/machines/server/virtualbox/private_key server.key
cp /vagrant/server.pub server.pub

chmod 600 *.key server.pub

#generate ssh key
yes | ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

#disable host checking for ansible
sed -i 's:#host_key_checking = False:host_key_checking = False:' /etc/ansible/ansible.cfg

#deploy ambari
ansible-playbook -i /home/vagrant/stuff/ansible/inventory /home/vagrant/stuff/ansible/main.yml

#and die
sleep 30
poweroff