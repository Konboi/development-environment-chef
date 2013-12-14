#
# Cookbook Name:: mysql::server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server"

service "mysqld" do 
  supports :restart => true
  action [:enable, :start]
end

