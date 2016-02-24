module DockerCloud
  class NodeTypeAPI < DockerCloud::BaseAPI
    def resource_url(name = '')
      "/nodetype/#{name}"
    end

    # Lists all node types of all supported cloud providers
    # Returns a list of NodeType objects
    def all(params={})
      response = http_get(resource_url, params)
      format_node_types(response)
    end

    # Returns the details of a specific NodeType
    def get(provider_name, node_type_name)
      name = "#{provider_name}/#{node_type_name}"
      response = http_get(resource_url(name))
      format_node_types(response)
    end

    private

    def format_node_types(response)
      if response.kind_of?(Array)
        formatted = []
        response.each do |obj|
          formatted.push(DockerCloud::NodeType.new(obj, client))
        end
      else
        formatted = DockerCloud::NodeType.new(response, client)
      end
      formatted
    end
  end
end