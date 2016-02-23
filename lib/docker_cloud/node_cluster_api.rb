module DockerCloud
  class NodeClusterAPI
    def url(params = '')
      "api/infra/#{DockderCloud::DOCKER_CLOUD_API_VERSION}/nodecluster/#{params}"
    end

    def all(params={})
      http_get(url, params)
    end

    # Create Params:
    # name (required): name for node cluster
    # node_type (required): type of node to be used for the cluster
    # region (reguired): resource URI of the region where node cluster is to be deployed
    # disk (optional): Size of the volume to create
    # nickname (optional)
    # target_num_nodes (optional): Number of nodes for the cluster. default: 1
    # tags (optional): default []
    # provider_options
    def create(params)
      http_post(url, params)
    end

    def get(uuid)
      http_get(url(uuid))
    end

    def update(uuid, params)
      http_patch(url(uuid), params)
    end

    def deploy(uuid)
      http_post(url("#{uuid}/deploy"))
    end

    def terminate(uuid)
      http_delete(url(uuid))
    end
  end
end