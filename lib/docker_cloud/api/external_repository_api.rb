module DockerCloud
  class ExternalRepositoryAPI < DockerCloud::BaseAPI
    TYPE = 'ExternalRepository'

    def resource_url(name = '')
      "/respository/#{name}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def create(params)
      response = http_post(resource_url, params)
      format_object(response, TYPE)
    end

    def get(name)
      response = http_get(resource_url(name))
      format_object(response, TYPE)
    end

    def update(name, params)
      response = http_patch(resource_url(name), params)
      format_object(response, TYPE)
    end

    def delete(name, user, image)
      url = "#{name}/#{user}/#{image}"
      http_delete(resource_url(url))
    end
  end
end