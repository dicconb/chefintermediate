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

if node['something']

	file "/tmp/diccon" do
	  action :create
	  content 'is awesome'
	end

end

execute 'dicconexecute' do
  only_if { File.exist?('/tmp/missing') }
  action :run
  command 'echo 1'
end