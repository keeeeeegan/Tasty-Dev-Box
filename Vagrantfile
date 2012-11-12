SITE_NAME = "localhost"

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

  # Assign this VM to a host-only network IP
  config.vm.network :hostonly, "192.168.33.10"

  #config.vm.forward_port 80, 8080
  #config.vm.forward_port 8000, 8001

  nfs = !Kernel.is_windows?
  config.vm.share_folder SITE_NAME, "/mnt/#{SITE_NAME}", "../", :nfs => nfs

  # install the newest version of the chef gem
  # because the lucid32 box has an older version
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
	chef.add_recipe "apache2"
	chef.add_recipe "mysql"
	chef.add_recipe "mysql::server"
	chef.add_recipe "php"
	chef.add_recipe "php::module_mysql"
	chef.add_recipe "apache2::mod_php5"
	chef.add_recipe "apache2::mod_rewrite"
	chef.add_recipe "keeg.me"

  end


end
