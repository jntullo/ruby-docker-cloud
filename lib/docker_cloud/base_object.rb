module DockerCloud
  class BaseObject
    include DockerCloud::Helpers
    attr_accessor :uuid, :resource_uri

    def initialize(response, client)
      @info = response
      @client = client
      @uuid = @info[:uuid]
      @resource_uri = @info[:uuid]
    end

    private

    def client
      @client
    end

    def info
      @info
    end
  end
end