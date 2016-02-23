module DockerCloud
  class NodeAPI < DockerCloud::BaseAPI
    def list_url(params = '')
      "/node/#{params}"
    end

    def all(params={})
      http_get(url, params)
    end

    def get(uuid)
      http_get(url(uuid))
    end

    def deploy_url(uuid)
      "#{uuid}/deploy/"
    end

    def deploy(uuid)
      http_post(url("#{uuid}/deploy"))
    end

    def terminate(uuid)
      http_delete(url(uuid))
    end
  end
end