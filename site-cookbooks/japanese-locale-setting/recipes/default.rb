#
# Cookbook Name:: japanese-locale-setting
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "update glibc-common" do
  code <<-EOF
    sudo yum install -y glibc-common
  EOF
end
