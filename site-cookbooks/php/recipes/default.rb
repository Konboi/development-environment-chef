#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php"
package "php-mbstring"
package "php-mysql"


template '/etc/php.ini' do
  owner 'root'
  mode 0644
end

