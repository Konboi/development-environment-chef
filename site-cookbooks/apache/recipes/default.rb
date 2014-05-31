#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd"

service "httpd" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

template '/etc/httpd/conf/httpd.conf' do
  owner 'root'
  mode 0644

  notifies :restart, "service[httpd]"
end
