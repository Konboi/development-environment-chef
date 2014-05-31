#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
bash "install emacs config" do
		user node["user"]["name"]
		group node["user"]["name"]

		code <<-EOF
		cd /home/#{node["user"]["name"]}/config/
		git clone git@github.com:Konboi/dot-emacs.git
		EOF

		not_if { File.exists? "/home/#{node["user"]["name"]}/config/dot-emacs"}
end

link "/home/#{node["user"]["name"]}/.emacs.d" do 
		to "/home/#{node["user"]["name"]}/config/dot-emacs"
end
