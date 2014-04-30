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

  not_if {File.exists? "/usr/local/emacs"}
end













