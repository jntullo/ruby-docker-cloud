module DockerCloud
  class NodeCluster < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def state; info[:state]; end
    # TODO: GET NODE TYPE
    def node_type; info[:node_type]; end
    def disk_size; info[:disk]; end
    # TODO: GET NDOES
    def nodes; info[:nodes]; end
    # TODO: GET REGIONS
    def region; info[:region]; end
    def target_num_nodes; info[:target_num_nodes]; end
    def current_num_nodes; info[:current_num_nodes]; end
    def deployed_date; info[:deployed_datetime]; end
    def destroyed_date; info[:destroyed_datetime]; end
    def tags; info[:tags]; end
    def provider_options; info[:provider_options]; end
    def nickname; info[:nickname]; end
  end
end