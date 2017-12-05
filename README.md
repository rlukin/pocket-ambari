# Pocket ambari
## allows you to setup ambari cluster on virtual machines for learning purposes, or serious production infrastructure

### One node
Maden for setup ambari on single machine (it was on windows host so, it ups small linux VM with ambari to provision it)
Also blueprint and hostmapping is provisioned.
#### Tips
* You'd better to have at least 16Gb of RAM
* Just run `vagrant up` and wait until everything is up
* Remove `provision_cluster` from `stuff/ansible/main.yml`, if you'd like to install different configuration
* Connect to ambari UI at localhost:8080

### Several node
Almost the same, but it indends for several nodes, where you proviosion by Vagrant VMs (with your ssh key for convinient)
Then you should provision nodes using ambari (change inventory file, for your needings)

#### Tips
* Set up nodes on several machines, and remember ip, that will shown after provision
* Add them to your dns, or just add to /etc/hosts
* Change invetory file, and fire up `provision_ambari_cluster.yml`
