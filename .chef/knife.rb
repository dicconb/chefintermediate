# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dicconb"
client_key               "#{current_dir}/dicconb.pem"
#validation_client_name   "dicconb-chef-intermediate-validator"
#validation_key           "#{current_dir}/dicconb-chef-intermediate-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/dicconb-chef-intermediate"
cookbook_path            ["#{current_dir}/../cookbooks"]
editor 					'"C:\Program Files\Sublime Text 2\sublime_text.exe" --wait'