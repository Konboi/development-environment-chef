#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ntp"

template "/etc/ntp.conf" do
  owner "root"
  mode  0644
  source "ntp.conf.erb"
end

service "ntpd" do
  action [ :enable, :start ]
end
