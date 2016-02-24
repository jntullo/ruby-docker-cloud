module DockerCloud
  class ExternalRepository < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def in_use; info[:in_user]; end
    # def registry; info[:registry]; end

    def registry
      @registry ||= client.registries.get_from_uri(info[:registry])
    end
  end
end