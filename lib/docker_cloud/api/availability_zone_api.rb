module DockerCloud
  class AvailabilityZoneAPI < DockerCloud::API
    TYPE = 'AvailabilityZone'.freeze
    def resource_url(zone = '')
      "/az/#{zone}"
    end

    # Lists all availability zones from all regions of supported cloud providers
    # Returns a list of Availability Zone objects
    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    # Gets all the details of a specific region for a specific provider
    # Returns a Region object
    def get(provider_name, region_name, az_name)
      provider_az = "#{provider_name}/#{region_name}/#{az_name}"
      response = http_get(resource_url(provider_az))
      format_object(response, TYPE)
    end
  end
end
