module DockerCloud
  class Stack < DockerCloud::Type
    def resource_uri
      info[:uui]
    end

    def name
      info[:name]
    end

    def state
      info[:state]
    end

    def synchronized
      info[:synchronized]
    end
    # def services; info[:services]; end

    def services
      if @services.nil?
        @services = []
        info[:services].each do |uri|
          @services.push(client.services.get_from_uri(uri))
        end
      end
      @services
    end

    def deployed_date
      info[:deployed_datetime]
    end

    def destroyed_date
      info[:destroyed_datetime]
    end

    def nickname
      info[:nickname]
    end
  end
end
