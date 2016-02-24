module DockerCloud
  class ExternalRepositoryAPI < DockerCloud::BaseAPI
    def resource_url(name = '')
      "/respository/#{name}"
    end

    def all(params = {})
      http_get(resource_url, params)
    end

    def create(params)
      http_post(resource_url, params)
    end

    def get(name)
      http_get(resource_url(name))
    end

    def update(name, params)
      http_patch(resource_url(name), params)
    end

    def delete(name, user, image)
      url = "#{name}/#{user}/#{image}"
      http_delete(resource_url(url))
    end
  end
end