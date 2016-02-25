module DockerCloud
  class AvailabilityZone < DockerCloud::Type
    def resource_uri
      info[:resource_uri]
    end

    def name
      info[:name]
    end

    def available
      info[:available]
    end

    def region
      @region ||= client.regions.get_from_uri(info[:region]) unless info[:region].nil?
    end
  end
end
