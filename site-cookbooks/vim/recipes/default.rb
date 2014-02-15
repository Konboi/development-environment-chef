#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "mercurial"
package "ncurses-devel"

bash "install vim" do
  code <<-EOF
     cd /usr/local/src
     hg clone https://vim.googlecode.com/hg/ vim
     cd /usr/local/src/vim
     ./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local
     make
     make install
  EOF

  not_if {File.exists? "/usr/local/vim"}
end

