module DockerCloud
  class RegistryAPI < DockerCloud::BaseAPI
    def resource_url(host = '')
      "/registry/#{host}"
    end

    def all(params = {})
      http_get(resource_url, params)
    end

    def get(host)
      http_get(resource_url(host))
    end
  end
end