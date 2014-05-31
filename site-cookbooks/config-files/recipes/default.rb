#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:user][:home]}/config" do
  owner node[:user][:name]
  group node[:user][:name]
  mode  0755
end
