#
# Cookbook Name:: config-files
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:user][:home]}/.bash" do
  owner node[:user][:name]
  group node[:user][:name]

  action :create
end

bash "git-completion" do
  user  node[:user][:name]
  group node[:user][:name]
  environment "HOME" => node[:user][:home]

  code <<-EOF
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P #{node[:user][:home]}/.bash/
    echo 'source ~/.bash/git-completion.bash' >>  /home/#{node[:user][:name]}/.bashrc
  EOF

  not_if "ls -l #{node[:user][:home]}/.bash/ | grep git-completion"
end

