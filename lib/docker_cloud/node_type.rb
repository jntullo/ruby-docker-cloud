module DockerCloud
  class NodeType < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def label; info[:label]; end
    def regions; info[:regions]; end
    def availability_zones; info[:availability_zones]; end
    def available; info[:available]; end

    def provider
      @provider ||= client.providers.get(info[:provider].split('provider/')[1].delete('/'))
    end
  end
end