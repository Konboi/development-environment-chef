#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/nginx/vhost.d/workspace.conf' do
  owner 'root'
  mode 0644

  notifies :restart, "service[nginx]"
end
