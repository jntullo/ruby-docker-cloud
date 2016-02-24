module DockerCloud
  class Provider < DockerCloud::Type
    attr_accessor :name, :label, :regions, :available

    def name; info[:name]; end

    def label; info[:label]; end

    def resource_uri; info[:resource_uri]; end

    def available; info[:available]; end

    def regions
       @regions ||= client.regions.all(provider: resource_uri)
    end
  end
end