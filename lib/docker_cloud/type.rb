module DockerCloud
  class Type
    attr_reader :info

    def initialize(response, client)
      @info = response
      @client = client
      @uuid = info[:uuid]
      @resource_uri = info[:uuid]
    end

    def reload
      refreshed = api.get_from_uri(resource_uri)
      @info = refreshed.info
    end

    def uuid
      info[:uuid]
    end

    def resource_uri
      info[:resource_uri]
    end

    private

    attr_reader :client
  end
end
