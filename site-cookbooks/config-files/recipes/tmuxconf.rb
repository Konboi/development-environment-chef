#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# .tmux.conf
cookbook_file "#{node["user"]["home"]}/.tmux.conf" do
  owner node["user"]["name"]
  group node["user"]["name"]
  mode 0600
end
