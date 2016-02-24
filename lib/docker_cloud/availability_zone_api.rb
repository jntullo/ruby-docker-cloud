module DockerCloud
  class AvailabilityZoneAPI < DockerCloud::BaseAPI
    def resource_url(zone = '')
      "/az/#{zone}"
    end

    # Lists all availability zones from all regions of supported cloud providers
    # Returns a list of Availability Zone objects
    def all(params={})
      http_get(resource_url, params)
    end

    # Gets all the details of a specific region for a specific provider
    # Returns a Region object
    def get(provider_name, region_name, az_name)
      provider_az = "#{provider_name}/#{region_name}/#{az_name}"
      http_get(resource_url(provider_az))
    end
  end
end