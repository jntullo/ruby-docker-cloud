module DockerCloud
  class Provider < DockerCloud::Type
    attr_accessor :name, :label, :regions, :available

    def name
      info[:name]
    end

    def label
      info[:label]
    end

    def resource_uri
      info[:resource_uri]
    end

    def available
      info[:available]
    end

    def regions
      if @regions.nil?
        @regions = []
        info[:regions].each do |region|
          @regions.push(client.regions.get_from_uri(region))
        end
      end
      @regions
    end
  end
end
