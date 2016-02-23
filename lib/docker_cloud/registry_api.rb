module DockerCloud
  class RegistryAPI < DockerCloud::BaseAPI
    def url(host = '')
      puts "#{DockerCloud::DOCKER_CLOUD_API_VERSION}"
      "/api/repo/#{DockerCloud::DOCKER_CLOUD_API_VERSION}/registry/#{host}"
    end

    def all(params={})
      http_get(url, params)
    end

    def get(host)
      http_get(url(host))
    end
  end
end