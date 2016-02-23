module DockerCloud
  class ContainerAPI
    def url(params = '')
      "/container/#{params}"
    end

    def all
      http_get(url)
    end

    def get(uuid)
      http_get(url(uuid))
    end

    def start(uuid)
      url = "#{uuid}/start/"
      http_post(url(url))
    end

    def stop(uuid)
      url = "#{uuid}/stop/"
      http_post(url(url))
    end

    def logs(uuid)
      url = "#{uuid}/logs/"
      http_get(url(url))
    end

    def terminate(uuid)
      http_terminate(url(uuid))
    end
  end
end