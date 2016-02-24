module DockerCloud
  class AvailabilityZone < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def region_name; @region_name ||= info[:region].slice('az/')[1].delete('/'); end
    def available; info[:available]; end

    def region
      @region ||= client.region.all(name: region_name)
    end
  end
end