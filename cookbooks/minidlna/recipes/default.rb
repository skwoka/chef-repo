#
# Cookbook Name:: minidlna
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# TODO check for platform
package 'minidlna' do
  action :install
end

template "/etc/minidlna.conf" do
  source "minidlna.conf.erb"
end
