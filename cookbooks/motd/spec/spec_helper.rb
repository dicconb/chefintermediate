require 'chefspec'
require 'chefspec/berkshelf'
ChefSpec::Coverage.start!

REDHAT_OPTS = {
  :platform => 'redhat',
  :version => '6.5',
  :log_level => :fatal,
  :file_cache_path => '/tmp'
}