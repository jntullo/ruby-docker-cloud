module DockerCloud
  class StreamAPI < DockerCloud::API
    STREAM_API_PATH = 'wss://ws.cloud.docker.com/api'.freeze

    def websocket
      @websocket ||= begin
        url = URI.escape(STREAM_API_PATH + '/' + root_path + '/' + API_VERSION + websocket_path)
        Faye::WebSocket::Client.new(url, nil, ping: 240, headers: headers)
      end
    end

    def on(type, &block)
      @listeners = {} unless @listeners
      @listeners[type.to_sym] = block
    end

    def run!(&block)
      EventMachine.kqueue = true if EventMachine.kqueue?

      EM.run {
        @shutting_down = false
        Signal.trap('INT')  { signal_handler('INT') }
        Signal.trap('TERM') { signal_handler('TERM') }

        if block_given?
          block.call
        end

        connect
      }
    end

    private

    def connect
      websocket.on :open do |event|
        _on_open(event)
      end
      websocket.on :message do |event|
        _on_message(event)
      end

      websocket.on :error do |event|
        _on_error(event)
      end

      websocket.on :close do |event|
        _on_close(event)
      end
    end

    def websocket_path
      nil
    end

    def signal_handler(type)
      # In rare cases the signal comes multiple times. If we're already shutting down ignore this.
      unless @shutting_down
        @shutting_down = true
        EventMachine.stop
      end
    end

    def _on_open(event)
      @listeners[:open].call(event) if @listeners[:open]
    end

    def _on_message(event)
      @listeners[:message].call(event) if @listeners[:message]
    end

    def _on_error(event)
      @listeners[:error].call(event) if @listeners[:error]
    end

    def _on_close(event)
      @listeners[:close].call(event) if @listeners[:close]
      unless @shutting_down
        connect
      end
    end

  end
end
