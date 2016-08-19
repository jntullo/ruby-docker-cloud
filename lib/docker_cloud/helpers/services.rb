module DockerCloud
  module Helpers
    module Services
      # This class serves both Containers and Services

      class ContainerPorts
        attr_accessor :protocol, :inner_port, :outer_port, :port_name,
          :uri_protocol, :endpoint_uri, :published

        def initialize(container_ports)
          @protocol = container_ports[:protocol]
          @inner_port = container_ports[:inner_port]
          @outer_port = container_ports[:outer_port]
          @port_name = container_ports[:outer_port]
          @uri_protocol = container_ports[:uri_protocol]
          @endpoint_uri = container_ports[:endpoint_uri]
          @published = container_ports[:published]
        end
      end

      def start
        api.start(uuid)
      end

      def stop
        api.stop(uuid)
      end

      def scale
        api.scale(uuid)
      end

      def redeploy
        api.redeploy(uuid)
      end

      def terminate
        api.terminate(uuid)
      end

      def update(params)
        api.update(uuid, params)
      end

      def roles
        info[:roles]
      end

      def privileged
        info[:privileged]
      end

      def container_ports
        if @container_ports.nil? && !info[:container_ports].nil?
          @container_ports = []
          info[:container_ports].each do |port|
            @container_ports.push(ContainerPorts.new(port))
          end
        end
        @container_ports
      end
    end
  end
end
