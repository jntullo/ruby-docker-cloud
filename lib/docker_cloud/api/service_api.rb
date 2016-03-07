module DockerCloud
  class ServiceAPI < DockerCloud::API
    TYPE = 'Service'.freeze

    def resource_url(params = '')
      "/service/#{params}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
    end

    def create(params)
      response = http_post(resource_url, params)
      format_object(response, TYPE)
    end

    def get(uuid)
      response = http_get(resource_url(uuid))
      format_object(response, TYPE)
    end

    def logs(uuid)
      url = "#{uuid}/logs/"
      http_get(resource_url(url))
    end

    def update(uuid, params)
      response = http_patch(resource_url(uuid), params)
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

    def redeploy(uuid)
      url = "#{uuid}/redeploy/"
      response = http_post(resource_url(url))
      format_object(response, TYPE)
    end

    def terminate(uuid)
      uuid = "#{uuid}/"
      response = http_delete(resource_url(uuid))
      format_object(response, TYPE)
    end
  end
end
