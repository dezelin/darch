Vagrant::Config.run do |config|
  config.vm.box = "quantal-server"
  config.vm.define :lb do |lb_config|
    lb_config.vm.network :hostonly, "10.0.0.10"
    lb_config.vm.box = "quantal-server"
    lb_config.vm.forward_port 80, 8080
    lb_config.ssh.timeout = 300
    lb_config.ssh.max_tries = 300
    lb_config.vm.customize ["modifyvm", :id, "--memory", 256]
    lb_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_role "base"
    end
  end
  config.vm.define :web do |web_config|
    web_config.vm.network :hostonly, "10.0.0.11"
    web_config.vm.box  = "quantal-server"
    web_config.vm.forward_port 8081, 8081
    web_config.vm.forward_port 8082, 8082
    web_config.ssh.timeout = 300
    web_config.ssh.max_tries = 300
    web_config.vm.customize ["modifyvm", :id, "--memory", 512]
    web_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_role "base"
    end
  end
  config.vm.define :db do |db_config|
    db_config.vm.network :hostonly, "10.0.0.12"
    db_config.vm.box  = "quantal-server"
    db_config.ssh.timeout = 300
    db_config.ssh.max_tries = 300
    db_config.vm.customize ["modifyvm", :id, "--memory", 256]
    db_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_role "base"
    end
  end
end
