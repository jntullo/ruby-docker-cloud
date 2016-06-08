require 'faye/websocket'
require 'eventmachine'

module DockerCloud
  class EventsAPI < DockerCloud::StreamAPI

    private

    def websocket_path
      @websocket_path ||= '/events'.freeze
    end

    def root_path
      'audit'
    end

    def _on_message(event)
      @listeners[:message].call(convert_to_dockercloud_event(event)) if @listeners[:message]
    end

    def convert_to_dockercloud_event(original_event)
      data = parse(original_event.data)
      options = {
        websocket_type: original_event.type,
        bubbles: original_event.bubbles,
        cancelable: original_event.cancelable,
        target: original_event.target,
        current_target: original_event.current_target,
        event_phase: original_event.event_phase
      }
      DockerCloud::Event.new('message', options.merge(data))
    end

  end
end
