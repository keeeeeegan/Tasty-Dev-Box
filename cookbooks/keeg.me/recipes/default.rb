# install vim because it is awesome
package "vim" do
	action :install
end

# setup the main localhost
web_app "localhost" do
	server_name "localhost"
	server_aliases "localhost"
	docroot "/mnt/localdev"
	template "localhost.conf.erb"
	directory_options "FollowSymLinks Indexes"
	enable true	
end