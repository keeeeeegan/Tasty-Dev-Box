# install vim because it is awesome
package "vim" do
	action :install
end

# install curl for rvm install
package "curl" do
	action :install
end

# install memcached
package "memcached" do
	action :install
end

# install memcached
package "php5-memcached" do
	action :install
	notifies :reload, "service[apache2]"
end

# setup the main localhost
web_app "localhost" do
	server_name "localhost"
	server_aliases "localhost"
	docroot "/mnt/localhost"
	template "localhost.conf.erb"
	directory_options "FollowSymLinks Indexes"
	enable true	
end


# random crap I want to save


#	chef.add_recipe "chef-ruby1.9"
#	chef.add_recipe "rvm"
#	chef.add_recipe "rvm::user_install"
	
#,
#      "rvm" => {
#      	"user_installs" => {
#        	"rubies" => ["1.9.2-p290", "ruby-1.9.3-p194"]
#    	}
#      }
	#chef.add_recipe "build-essential"	
	#chef.add_recipe "apache2::mod_xsendfile"
	#chef.add_recipe "build-essential"
	#chef.add_recipe "keeg.me"
	#"socket" =>  
	#"allow_remote_root" => true,
	#"bind_address" => "*"
	#,
    #  {"rvm" => {
    #    "rubies" => ["1.9.2-p290", "ruby-1.9.3-p194"]
    #  }	
 

#execute "install rvm and ruby" do
#	command "curl -L https://get.rvm.io | bash -s stable --ruby"
#	user "root"
#end

#execute "rvm install 1.9.2p290" do
#	command 'rvm install 1.9.2p290'
#end

# install rvm
# \curl -L https://get.rvm.io | bash -s stable --ruby
# rvm install 1.9.2p290
#execute "install rvm and ruby" do
#	command '\curl -L https://get.rvm.io | bash -s stable --ruby'
#	action :run
#end