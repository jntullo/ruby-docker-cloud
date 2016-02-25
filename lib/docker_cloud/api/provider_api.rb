module DockerCloud
  class ProviderAPI < DockerCloud::API
    TYPE = 'Provider'.freeze

    def resource_url(name = '')
      "/provider/#{name}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def get(name)
      response = http_get(resource_url(name))
      format_object(response, TYPE)
    end
  end
end
