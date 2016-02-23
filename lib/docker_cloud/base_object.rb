module DockerCloud
  class BaseObject
    attr_accessor :uuid, :resource_uri

    def initialize(json)
      puts json
    end

  end
end