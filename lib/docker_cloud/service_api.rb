module DockerCloud
  class ServiceAPI < DockerCloud::BaseAPI
    def url(params = '')
      "/service/#{params}"
    end

    def all
      http_get(list_url)
    end

    def create(params)
      http_post(url, params)
    end

    def get(uuid)
      http_get(url(uuid))
    end

    def logs(uuid)
      url = "#{uuid}/logs"
      http_get(url(url))
    end

    def update(uuid, params)
      http_patch(url(uuid), params)
    end

    def start(uuid)
      url = "#{uuid}/start/"
      http_post(url(url))
    end

    def stop(uuid)
      url = "#{uuid}/stop/"
      http_post(url(url))
    end

    def redeploy(uuid)
      url = "#{uuid}/redeploy/"
      http_post(url(url))
    end

    def terminate(uuid)
      http_delete(url(uuid))
    end
  end
end