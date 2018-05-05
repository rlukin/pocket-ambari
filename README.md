# Pocket ambari
## Set up your own hadoop cluster based on ambaril using virtual machines for learning purposes on several hosts

### Single node
This part was made for setting up ambari on single machine using VM with ansible (main reason - I had to use Windows)
Also blueprint and hostmapping is provisioned.

#### How to start
* Better to have at least 16Gb of RAM
* Just run `vagrant up` and wait until everything is up
* Remove `provision_cluster` from `stuff/ansible/main.yml`, if you'd like to install different configuration
* Connect to ambari UI at localhost:8080
* Creds `admin:admin`


### Several nodes
This part uses underlying linux host for ansible.
Used to simulate sort of 'cluster' and work on several nodes (with your ssh key inside vms for convinient)

#### How to start
* First of all, add your key into `provision.sh`
* Spin up vms on several machines using `vagrant up ambarinode1`, for instance. Don't forget to remember ip, that should be shown after provisioning.
* Add them to your dns, or just add to /etc/hosts. On top of that, add them into `group_vars/all`
* Blueprint role contains passwords, just change it here on demand `roles/blueprint/vars/main.yml` 
* Fire up `ansible-playbook -i inventory provision_ambari_cluster.yml`
