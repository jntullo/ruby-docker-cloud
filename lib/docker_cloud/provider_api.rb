module DockerCloud
  class ProviderAPI < DockerCloud::BaseAPI
    def resource_url(name = '')
      "/provider/#{name}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_providers(response)
    end

    def get(name)
      response = http_get(resource_url(name))
      format_providers(response)
    end

    private

    def format_providers(response)
      if response.kind_of?(Array)
        formatted = []
        response.each do |obj|
          formatted.push(DockerCloud::Provider.new(obj, client))
        end
      else
        formatted = DockerCloud::Provider.new(response, client)
      end
      formatted
    end
  end
end