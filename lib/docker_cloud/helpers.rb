module DockerCloud
  module Helpers
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

    private

    def format_object(response, type)
      type = Object.const_get "DockerCloud::#{type}"
      if response.kind_of?(Array)
        formatted = []
        response.each do |obj|
          formatted.push(type.new(obj, client))
        end
      else
        formatted = type.new(response, client)
      end
      formatted
    end
  end
end