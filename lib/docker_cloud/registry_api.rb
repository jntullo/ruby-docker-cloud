module DockerCloud
  class RegistryAPI < DockerCloud::BaseAPI
    def url(host = '')
      "/registry/#{host}"
    end

    def all(params={})
      http_get(url, params)
    end

    def get(host)
      http_get(url(host))
    end
  end
end