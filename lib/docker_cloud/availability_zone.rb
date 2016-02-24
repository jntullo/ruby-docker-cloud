module DockerCloud
  class AvailabilityZone < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def available; info[:available]; end

    def region
      @region ||= client.region.get_from_url(info[:region])
    end
  end
end