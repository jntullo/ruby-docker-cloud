module DockerCloud
  class NodeClusterAPI < DockerCloud::API
    TYPE = 'NodeCluster'.freeze

    def resource_url(params = '')
      "/nodecluster/#{params}"
    end

    def all(params = {})
      response = http_get(resource_url, params)
      format_object(response, TYPE)
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
      response = http_post(resource_url, params)
      format_object(response, TYPE)
    end

    def get(uuid)
      response = http_get(resource_url(uuid))
      format_object(response, TYPE)
    end

    def update(uuid, params)
      response = http_patch(resource_url(uuid), params)
      format_object(response, TYPE)
    end

    def deploy(uuid)
      http_post(resource_url("#{uuid}/deploy/"))
    end

    def terminate(uuid)
      uuid = "#{uuid}/"
      http_delete(resource_url(uuid))
    end
  end
end
