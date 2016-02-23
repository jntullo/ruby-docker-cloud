module DockerCloud
  class Provider
    attr_accessor :resource_uri, :name, :label, :regions, :available

    def initialize(body)
      @resource_uri = body['resource_uri']
      @name = body['name']
      @label = body['label']
      @regions = body['regions']
      @available = body['available']
    end
  end
end