#
# Cookbook Name:: npm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["npm"].each do |name|
  bash "install npm #{name}" do
    user  node["user"]["name"]
    group node["user"]["name"]
    cwd   node["user"]["home"]
    environment "HOME" => node["user"]["home"]

    code <<-EOF
    #{node["user"]["home"]}/.anyenv/envs/ndenv/shims/npm install -g #{name}
    EOF

    not_if "npm ls -g | grep #{name}"
  end
end
