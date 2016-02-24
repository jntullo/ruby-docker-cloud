module DockerCloud
  class RegionAPI < DockerCloud::BaseAPI
    def resource_url(provider_region = '')
      "/region/#{provider_region}"
    end

    # Lists all regions of all supported cloud providers.
    # Returns a list of Region objects
    def all(params = {})
      response = http_get(resource_url, params)
      format_regions(response)
    end

    # Gets all the details of a specific region for a specific provider
    # Returns a Region object
    def get(provider_name, region_name)
      provider_region = "#{provider_name}/#{region_name}"
      response = http_get(resource_url(provider_region))
      format_regions(response)
    end

    private

    def format_regions(response)
      if response.kind_of?(Array)
        formatted = []
        response.each do |obj|
          formatted.push(DockerCloud::Region.new(obj, client))
        end
      else
        formatted = DockerCloud::Region.new(response, client)
      end
      formatted
    end
  end
end