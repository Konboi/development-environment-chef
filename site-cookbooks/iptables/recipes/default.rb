#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "iptables"

service "iptables" do
  supports :status => true, :stop => true
  action [:disable, :stop]
end

