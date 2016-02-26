module DockerCloud
  module Helpers
    module API
      private

      def format_object(response, type)
        type = Object.const_get "DockerCloud::#{type}"
        if response.is_a?(Array)
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
end
