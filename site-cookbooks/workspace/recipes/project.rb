#
# Cookbook Name:: workspace
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/home/vagrant/project" do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
  not_if { File.exists? "/home/vagrant/project" }
end
