#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "redis"

service "redis" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end
