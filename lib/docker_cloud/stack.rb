module DockerCloud
  class Stack < DockerCloud::Type
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

    def start
      api.start(uuid)
    end

    def redeploy
      api.redeploy(uuid)
    end

    def terminate
      api.terminate(uuid)
    end

    def stop
      api.stop(uuid)
    end

    def update(params)
      api.update(uuid, params)
    end

    def export
      api.export(uuid)
    end

    private

    def api
      client.stacks
    end
  end
end
