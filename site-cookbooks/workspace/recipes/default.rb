#
# Cookbook Name:: workspace
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/home/vagrant/workspace" do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
  not_if { File.exists? "/home/vagrant/workspace" }
end

programming_languages = %(ruby javascript perl others)

programming_languages.each do |language|
  directory "/home/vagrant/workspace/#{language}" do
    owner "vagrant"
    group "vagrant"
    mode 0755
    action :create
    not_if { File.exists? "/home/vagrant/workspace/#{language}" }
  end
end
