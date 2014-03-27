#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# https://github.com/treasure-data/chef-td-agent/blob/master/recipes/default.rb

group 'td-agent' do
  group_name 'td-agent'
  gid        403
  action     [:create]
end

user 'td-agent' do
  comment  'td-agent'
  uid      403
  group    'td-agent'
  home     '/var/run/td-agent'
  shell    '/bin/false'
  password nil
  supports :manage_home => true
  action   [:create, :manage]
end

directory '/etc/td-agent/' do
  owner  'td-agent'
  group  'td-agent'
  mode   '0755'
  action :create
end

yum_repository "treasure-data" do
  url "http://packages.treasure-data.com/redhat/$basearch"
  gpgkey "http://packages.treasure-data.com/redhat/RPM-GPG-KEY-td-agent"
  action :add
end

template "/etc/td-agent/td-agent.conf" do
  mode "0644"
  source "td-agent.conf.erb"
end

package "td-agent" do
  options value_for_platform(
    ["ubuntu", "debian"] => {"default" => "-f --force-yes"},
    "default" => nil
  )
  action :upgrade
end

service "td-agent" do
  action [ :enable, :start ]
  subscribes :restart, resources(:template => "/etc/td-agent/td-agent.conf")
end

node[:td_agent][:plugins].each do |plugin|
  if plugin.is_a?(Hash)
    plugin_name, plugin_attributes = plugin.first
    td_agent_gem plugin_name do
      plugin true
      %w{action version source options gem_binary}.each do |attr|
        send(attr, plugin_attributes[attr]) if plugin_attributes[attr]
      end
    end
  elsif plugin.is_a?(String)
    td_agent_gem plugin do
      plugin true
    end
  end
end
