#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


directory "#{node["user"]["home"]}/.ssh" do
  owner node["user"]["name"]
  group node["user"]["name"]
  mode 0700
  action :create
end

# set id_rsa
cookbook_file "#{node["user"]["home"]}/.ssh/id_rsa" do
  owner node["user"]["name"]
  group node["user"]["name"]
  mode 0600
end

# set id_rsa.pub
cookbook_file "#{node["user"]["home"]}/.ssh/id_rsa.pub" do
  owner node["user"]["name"]
  group node["user"]["name"]
  mode 0600
end
