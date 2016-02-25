module DockerCloud
  class RegistryAPI < DockerCloud::API
    TYPE = 'Registry'.freeze

    def resource_url(host = '')
      "/registry/#{host}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def get(host)
      response = http_get(resource_url(host))
      format_object(response, TYPE)
    end
  end
end
