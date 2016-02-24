module DockerCloud
  class NodeAPI < DockerCloud::BaseAPI
    def resource_url(params = '')
      "/node/#{params}"
    end

    def all(params={})
      http_get(resource_url, params)
    end

    def get(uuid)
      http_get(resource_url(uuid))
    end

    def deploy_url(uuid)
      "#{uuid}/deploy/"
    end

    def deploy(uuid)
      http_post(resource_url("#{uuid}/deploy"))
    end

    def terminate(uuid)
      http_delete(resource_url(uuid))
    end
  end
end