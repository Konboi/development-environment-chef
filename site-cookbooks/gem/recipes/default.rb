#
# Cookbook Name:: gem
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["gem"].each do |name|
  bash "install gem global" do
    user node["user"]["name"]
    group node["user"]["name"]
    cwd node["user"]["home"]
    environment "HOME" => node["user"]["home"]

    code <<-EOF
    gem install #{name}
    rbenv rehash
    EOF

    not_if "gem list --local | grep #{name}"
  end
end
