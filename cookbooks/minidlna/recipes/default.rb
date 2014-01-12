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

# create media directories
node["minidlna"]["media_dir"].each do |media_dir|
  dir = media_dir.partition(",").last
  directory dir do
    owner "minidlna"
    group "minidlna"
    action :create
  end
end
