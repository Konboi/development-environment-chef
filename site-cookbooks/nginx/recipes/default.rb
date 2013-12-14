#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx'

directory '/etc/nginx/vhost.d/' do
  mode 0755
  owner 'nginx'
  group 'nginx'
  recursive true
end


service 'nginx' do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

template '/etc/nginx/nginx.conf' do
  owner 'root'
  mode 0644

  notifies :restart, "service[nginx]"
end
