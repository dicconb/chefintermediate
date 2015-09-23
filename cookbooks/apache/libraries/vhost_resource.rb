class Chef
  class Resource
    class ApacheVhost < Chef::Resource::LWRPBase
      self.resource_name = :apache_vhost
      actions :create, :remove

      attribute :site_name, name_attribute: true, kind_of: String
      attribute :site_port, default: 80, kind_of: Fixnum

      default_action :create
    end
  end
end
