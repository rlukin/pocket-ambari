#! /bin/bash

yes | ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

#copy public key into shared directory
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server.pub

#copy all stuff, but, truly we just need map and blueprint
cp -r /vagrant/stuff/ /home/vagrant/