#
# Cookbook Name:: emacs
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

package 'gcc'
package 'make'
package 'ncurses-devel'

bash "install emacs" do
  code <<-EOF
    cd /tmp
    wget http://core.ring.gr.jp/pub/GNU/emacs/emacs-24.3.tar.gz
    tar zxvf emacs-24.3.tar.gz
    cd emacs-24.3
    ./configure --without-x
    make
    make install
  EOF

  not_if {File.exists? "/usr/local/bin/emacs"}
end

bash "rename timeout command" do
  code <<-EOC
    mv /usr/bin/timeout /usr/bin/timeout-backup
  EOC

  if {File.exists? "/usr/bin/timeout-backup"}
end

bash "cask install" do
  user node[:user][:name]
  cwd  node[:user][:home]
  environment "HOME" => node[:user][:home]

  code <<-EOF
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python
  EOF

  not_if {File.exists? "#{node[:user][:home]}/.cask"}
end
