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

bash "git-prompt" do
  user  node[:user][:name]
  group node[:user][:name]

  bash_config = "GIT_PS1_SHOWDIRTYSTATE=true \n"
  bash_config = bash_config + "PS1='\[\033[40;1;32m\]\\u" + "\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 \"[%s]\" )\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +\"%Y/%m/%d %p %H:%M:%S\"` \[\033[0m\]\n\\$  '\n"
  bash_config = bash_config + "export PS1=$PS1\n"

  code <<-EOF
    wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -P /home/#{node[:user][:name]}/.bash/
    echo 'source ~/.bash/git-prompt.sh' >>  /home/#{node[:user][:name]}/.bashrc
    echo  \'#{bash_config}\' >> /home/#{node[:user][:name]}/.bashrc
    echo 'export PS1=$PS1' >> /home/#{node[:user][:name]}/.bashrc
  EOF

  not_if "ls -l /home/#{node[:user][:name]}/.bash/ | grep git-prompt"
end

