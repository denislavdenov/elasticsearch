Vagrant.configure("2") do |config|
  config.vm.define vm_name1="elastic" do |node|
    node.vm.box = "denislavd/base-xenial64"
    node.vm.hostname = vm_name1
    node.vm.network "forwarded_port", guest: 5601, host: 5601, auto_correct: true
    node.vm.provision :shell, inline: "cd /vagrant ; bash scripts/provision_elastic.sh"
    node.vm.network "private_network", ip: "192.168.56.56"
    node.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
   end
end

  config.vm.define vm_name2="mysql" do |node|
    node.vm.box = "denislavd/mysql64"
    node.vm.hostname = vm_name2
   node.vm.provision :shell, inline: "cd /vagrant ; bash scripts/provision_mysql.sh"
    node.vm.network "private_network", ip: "192.168.56.57"
    node.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
    end
end

  config.vm.define vm_name3="nginx" do |node|
    node.vm.box = "denislavd/nginx64"
    node.vm.hostname = vm_name3
    node.vm.network "forwarded_port", guest: 80, host: 8080
    node.vm.provision :shell, inline: "cd /vagrant ; bash scripts/provision_nginx.sh"
    node.vm.network "private_network", ip: "192.168.56.58"
    node.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
    end
  end
end
