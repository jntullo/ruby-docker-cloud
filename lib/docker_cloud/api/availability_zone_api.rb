module DockerCloud
  class AvailabilityZoneAPI < DockerCloud::API
    def resource_url(zone = '')
      "/az/#{zone}"
    end

    # Lists all availability zones from all regions of supported cloud providers
    # Returns a list of Availability Zone objects
    def all(params={})
      response = http_get(resource_url, params)
      format_az(response)
    end

    # Gets all the details of a specific region for a specific provider
    # Returns a Region object
    def get(provider_name, region_name, az_name)
      provider_az = "#{provider_name}/#{region_name}/#{az_name}"
      http_get(resource_url(provider_az))
    end

    private

    def format_az(response)
      if response.kind_of?(Array)
        formatted = []
        response.each do |obj|
          formatted.push(DockerCloud::AvailabilityZone.new(obj, client))
        end
      else
        formatted = DockerCloud::AvailabilityZone.new(response, client)
      end
      formatted
    end
  end
end