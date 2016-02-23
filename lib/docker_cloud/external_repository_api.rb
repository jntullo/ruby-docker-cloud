module DockerCloud
  class ExternalRepositoryAPI < DockerCloud::BaseAPI
    def url(name = '')
      "api/infra/#{DockderCloud::DOCKER_CLOUD_API_VERSION}/respository/#{name}"
    end

    def all
      http_get(url)
    end

    def create(params)
      http_post(url, params)
    end

    def get(name)
      http_get(url(name))
    end

    def update(name, params)
      http_patch(url(name), params)
    end

    def delete(name, user, image)
      url = "#{name}/#{user}/#{image}"
      http_delete(url(url))
    end
  end
end