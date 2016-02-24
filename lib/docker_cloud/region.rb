module DockerCloud
  class Region < DockerCloud::Type

    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def label; info[:label]; end
    # def availability_zones; info[:availability_zones]; end
    def available; info[:available]; end

    def node_types
      @node_types ||= client.node_types.all(region: name)
    end

    def availability_zones
      @availability_zones ||= client.availability_zones.all(region: name)
    end
  end
end