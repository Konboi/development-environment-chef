#
# Cookbook Name:: common-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
packages = %w(
"curl"
"gcc-c++"
"libpng"
"libpng-devel"
"giflib"
"giflib-devel"
"libjpeg"
"subversion"
"telnet"
"nc"
"iotop"
"dstat"
"vim-enhanced"
"ack"
"mlocate"
"sysstat"
"file"
"lsof"
"git"
"ngrep"
"libmemcached"
"libmemcached-devel"
"bind-utils"
"strace"
"tmux"
"irqbalance"
"screen"
"ImageMagick"
 "ImageMagick-devel"
)

pakcages.each do |p|
    package p
end