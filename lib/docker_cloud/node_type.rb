module DockerCloud
  class NodeType < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def label; info[:label]; end
    def regions; info[:regions]; end
    # def availability_zones; info[:availability_zones]; end
    def available; info[:available]; end

    def provider
      @provider ||= client.providers.get_from_uri(info[:provider])
    end

    def availability_zones
      if @az.nil?
        @az = []
        info[:availability_zones].each do |az|
          @az.push(client.availability_zones.get_from_uri(az))
        end
      end
      @az
    end
  end
end