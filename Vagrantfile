# -*- mode: ruby -*-
# vi: set ft=ruby :
def Kernel.is_windows?
    # Detect if we are running on Windows
    processor, platform, *rest = RUBY_PLATFORM.split("-")
    platform == 'mingw32'
end

Vagrant::Config.run do |config|

  config.vm.box = "tastydev"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "192.168.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  #config.vm.forward_port 80, 8080
  #config.vm.forward_port 8000, 8001

  nfs = !Kernel.is_windows?
  config.vm.share_folder "localdev", "/mnt/localdev", "../", :nfs => nfs

  # install the newest version of the chef gem
  # because the lucid box has an older version
  config.vm.provision :shell, :path => "shell/upgrade.sh"
  
  # turn off beeping for cygwin users
  config.vm.provision :shell, :path => "shell/cygwinnobeep.sh"

  config.vm.provision :chef_solo do |chef| 
    chef.cookbooks_path = "cookbooks"

    chef.json = {
      "mysql" => {
        "server_root_password" => "root",
        "server_repl_password" => "root",
        "server_debian_password" => "root",
        "allow_remote_root" => true
      }
    }   

	chef.add_recipe "openssl"
	#chef.add_recipe "build-essential"
	chef.add_recipe "apache2"
	chef.add_recipe "mysql"
	chef.add_recipe "mysql::server"
	chef.add_recipe "php"
	chef.add_recipe "php::module_mysql"
	chef.add_recipe "apache2::mod_php5"
	chef.add_recipe "apache2::mod_rewrite"
	chef.add_recipe "keeg.me"
	

	#chef.add_recipe "apache2::mod_xsendfile"

#chef.add_recipe "build-essential"
    #chef.add_recipe "keeg.me"
 #"socket" =>  
 #        "allow_remote_root" => true,
  #      "bind_address" => "*"
 
  end


end
