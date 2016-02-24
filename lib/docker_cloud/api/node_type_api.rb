module DockerCloud
  class NodeTypeAPI < DockerCloud::API
    TYPE = 'NodeType'

    def resource_url(name = '')
      "/nodetype/#{name}"
    end

    # Lists all node types of all supported cloud providers
    # Returns a list of NodeType objects
    def all(params={})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    # Returns the details of a specific NodeType
    def get(provider_name, node_type_name)
      name = "#{provider_name}/#{node_type_name}"
      response = http_get(resource_url(name))
      format_object(response, TYPE)
    end
  end
end