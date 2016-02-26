module DockerCloud
  class NodeCluster < DockerCloud::Type
    def resource_uri
      info[:resource_uri]
    end

    def name
      info[:name]
    end

    def state
      info[:state]
    end

    # def node_type; info[:node_type]; end
    def node_type
      @node_type ||= client.node_types.get_from_uri(info[:node_type])
    end

    def disk_size
      info[:disk]
    end

    def nodes
      if @nodes.nil? && !info[:nodes].nil?
        @nodes = []
        info[:nodes].each do |node_uri|
          @nodes.push(client.nodes.get_from_uri(node_uri))
        end
      end
      @nodes
    end

    # def region; info[:region]; end
    def region
      @region ||= client.regions.get_from_uri(info[:region])
    end

    def target_num_nodes
      info[:target_num_nodes]
    end

    def current_num_nodes
      info[:current_num_nodes]
    end

    def deployed_date
      info[:deployed_datetime]
    end

    def destroyed_date
      info[:destroyed_datetime]
    end

    def tags
      info[:tags]
    end

    def provider_options
      info[:provider_options]
    end

    def nickname
      info[:nickname]
    end

    def deploy
      api.deploy(uuid)
    end

    def terminate
      api.terminate(uuid)
    end

    def update(params)
      api.update(uuid, params)
    end

    private

    def api
      client.node_clusters
    end
  end
end
