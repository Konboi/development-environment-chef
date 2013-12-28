#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

directory "/home/#{node["user"]["name"]}/config" do
		owner node["user"]["name"]
		group node["user"]["name"]
		action :create
end

bash "install vim config" do
		user node["user"]["name"]
		group node["user"]["name"]
		
		code <<-EOF
		cd /home/#{node["user"]["name"]}/config/
		git clone git@github.com:Konboi/vim-config.git 
		EOF

		not_if { File.exists? "/home/#{node["user"]["name"]}/config/vim-config"}
end

link "/home/#{node["user"]["name"]}/.vimrc" do 
		to "/home/#{node["user"]["name"]}/config/vim-config/vimrc"
end
