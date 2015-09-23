#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

ruby_block "randomly_choose_language" do
  block do
    if Random.rand > 0.5
      node.run_state['scripting_language'] = 'php'
    else
      node.run_state['scripting_language'] = 'perl'
    end
  end
end

package "scripting_language" do
 package_name lazy { node.run_state['scripting_language'] }
 action :install
end

apache_vhost 'welcome' do
  action :remove
end

# Disable the default virtual host
execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do 
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|
  # Set the document root

  # Enable an Apache Virtualhost
  apache_vhost site_name do
    action :create
    site_port site_data["port"]
    notifies :restart, "service[httpd]"
  end
end

service "httpd" do
  action [ :enable, :start ]
end
