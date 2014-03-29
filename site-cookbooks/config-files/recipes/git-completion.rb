#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/home/#{node[:user][:name]}/.bash" do
  owner node[:user][:name]
  group node[:user][:name]

  action :create
end

bash "git-completion" do
  user  node[:user][:name]
  group node[:user][:name]

  code <<-EOF
    wget wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh  -P /home/#{node[:user][:name]}/.bash/
    echo 'source ~/.bash/git-completion.bash' >>  /home/#{node[:user][:name]}/.bashrc
  EOF

  not_if "ls -l /home/#{node[:user][:name]}/.bash/ | grep git-completion"
end

