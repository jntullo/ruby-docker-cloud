module DockerCloud
  class ContainerAPI < DockerCloud::BaseAPI
    TYPE = 'Container'

    def resource_url(params = '')
      "/container/#{params}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def get(uuid)
      http_get(resource_url(uuid))
      format_object(response, TYPE)
    end

    def start(uuid)
      url = "#{uuid}/start/"
      http_post(resource_url(url))
    end

    def stop(uuid)
      url = "#{uuid}/stop/"
      http_post(resource_url(url))
    end

    def logs(uuid)
      url = "#{uuid}/logs/"
      http_get(resource_url(url))
    end

    def terminate(uuid)
      http_terminate(resource_url(uuid))
    end
  end
end