#
# Cookbook Name:: common-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
packages = %w(
curl
gcc-c++
libpng
libpng-devel
giflib
giflib-devel
libjpeg
subversion
telnet
nc
iotop
dstat
vim-enhanced
ack
mlocate
sysstat
file
lsof
git
git-svn
ngrep
libmemcached
libmemcached-devel
bind-utils
strace
tmux
irqbalance
screen
ImageMagick
ImageMagick-devel
openssl
openssl-devel
readline
libyaml-devel
readline-devel
zlib
zlib-devel
tig
wget
cmake
graphviz
graphviz-devel
)

packages.each do |p|
    package p
end
