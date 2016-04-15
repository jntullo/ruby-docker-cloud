require 'faye/websocket'
require 'faye/websocket/api/event'

module DockerCloud
  class Event < Faye::WebSocket::API::MessageEvent
    attr_reader :action, :parents, :resource_uri, :state, :uuid, :datetime
  end
end
