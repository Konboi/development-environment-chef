#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

packages = %w( mysql mysql-devel mysql mysql-libs )

packages.each do |pkg|
  package pkg
end


