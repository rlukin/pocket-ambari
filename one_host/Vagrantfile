machines = [
  { :name => 'node1',   :ip => '10.0.3.20',  :memory => '3064' },
  { :name => 'node2',   :ip => '10.0.3.21',  :memory => '3064' },
]

Vagrant.configure("2") do |config|
  #ambari nodes
  machines.each do |machine|
    config.vm.define machine[:name] do |config|
	
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = machine[:name] + '.vbox'
          config.vm.network "public_network", ip: machine[:ip]


      config.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.name = machine[:name]
            vb.memory = machine[:memory]
      end
    end
  end
  
  #ambari server 
  config.vm.define 'server' do |config|	
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = 'server.vbox'
    config.vm.network "public_network", ip: '10.0.3.15'
	config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = 'server'
        vb.memory = 3064
    end
    
    config.vm.provision "shell", path: 'server.sh'
  end
  
  #ansible control machine
  config.vm.define 'ansiblecontrol' do |config|	
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = 'ansiblecontrol'
    config.vm.network "public_network", ip: '10.0.3.100'
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = 'ansiblecontrol'
        vb.memory = 400
    end
    
    config.vm.provision "shell", path: 'ansible.sh'
  end

end