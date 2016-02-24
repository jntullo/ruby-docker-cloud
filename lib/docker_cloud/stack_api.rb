module DockerCloud
  class StackAPI < DockerCloud::BaseAPI
    def resource_url(name = '')
      "/stack/#{name}"
    end

    def all(params = {})
      http_get(resource_url, params)
    end

    def get(uuid)
      http_get(resource_url(uuid))
    end


    def create(params)
      http_post(resource_url, params)
    end

    def export(uuid)
      url = "#{uuid}/export/"
      http_get(resource_url(url))
    end

    def update(uuid, params)
      http_patch(resource_url(uuid), params)
    end

    def stop(uuid)
      url = "#{uuid}/stop"
      http_post(resource_url(url))
    end

    def start(uuid)
      url = "#{uuid}/start"
      http_post(resource_url(url))
    end

    def redeploy(uuid)
      url = "#{uuid}/redeploy"
      http_post(resource_url(url))
    end

    def terminate(uuid)
      http_delete(resource_url(uuid))
    end
  end
end