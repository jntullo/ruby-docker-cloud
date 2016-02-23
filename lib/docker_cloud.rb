require "docker_cloud/version"

module DockerCloud
  class Client
    attr_reader :username, :api_key

    def initialize(username, api_key)
      @username = username
      @api_key = api_key
    end
  end
end
