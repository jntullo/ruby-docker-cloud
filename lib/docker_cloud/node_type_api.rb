module DockerCloud
  class NodeTypeAPI
    def list_url(name = '')
      "/nodetype/#{name}"
    end

    # Lists all node types of all supported cloud providers
    # Returns a list of NodeType objects
    def all(params={})
      http_get(list_url, params)
    end

    # Returns the details of a specific NodeType
    def get_by_name(provider_name, node_type_name)
      name = "#{provider_name}/#{node_type_name}"
      http_get(list_url(name))
    end
  end
end