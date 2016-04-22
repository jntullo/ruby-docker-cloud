module DockerCloud
  class ContainerAPI < DockerCloud::API
    TYPE = 'Container'.freeze

    def resource_url(params = '')
      "/container/#{params}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def get(uuid)
      response = http_get(resource_url(uuid))
      format_object(response, TYPE)
    end

    def start(uuid)
      url = "#{uuid}/start/"
      response = http_post(resource_url(url))
      format_object(response, TYPE)
    end

    def stop(uuid)
      url = "#{uuid}/stop/"
      response = http_post(resource_url(url))
      format_object(response, TYPE)
    end

    def logs(uuid)
      url = "#{uuid}/logs/"
      response = http_get(resource_url(url))
      format_object(response, TYPE)
    end

    def terminate(uuid)
      response = http_delete(resource_url(uuid))
      format_object(response, TYPE)
    end

    # NOTE: Container redeployment will make a destructive update.
    #       redeploy will update the container UUID. 
    #       But response is still the old UUID.
    def redeploy(uuid)
      url = "#{uuid}/redeploy/"
      response = http_post(resource_url(url))
      format_object(response, TYPE)
    end
  end
end
