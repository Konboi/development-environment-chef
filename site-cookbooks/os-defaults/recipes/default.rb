#
# Cookbook Name:: os-defaults
# Recipe:: default
#
# Copyright 2014, KAYAC
#
# All rights reserved - Do Not Redistribute
#

## disk access統計を取得, 1分ごとにsysstatを取得
template "/etc/cron.d/sysstat" do
  owner "root"
  mode 0644
end

package "postfix"
package "sendmail" do
  action :remove
end

service "iptables" do
  action [:disable, :stop]
  not_if { node[:recipes].include? "iptables" }
end

## clock & timezone
cookbook_file "/etc/sysconfig/clock" do
  owner "root"
  mode 0644
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Japan"
end

service "ip6tables" do
  action [:disable, :stop]
end

autoupfile = "/etc/sysconfig/yum-autoupdate"

if File.exists? autoupfile
  if File.open(autoupfile).read.match(/ENABLED="true"/)
    rc = Chef::Util::FileEdit.new(autoupfile)
    rc.search_file_replace_line(/ENABLED\=\"true\"/, "ENABLED\=\"false\"")
    rc.write_file
    Chef::Log::info "yum autoupdate disabled"
  end
end
