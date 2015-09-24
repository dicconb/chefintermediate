#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/motd" do
  action :create
  source "motd.erb"
  mode "0644"
end

file "/tmp/diccon" do
  action :create
  content 'is awesome'
end
