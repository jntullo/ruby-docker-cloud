module DockerCloud
  class ContainerStreamAPI < DockerCloud::StreamAPI
    def initialize(uuid, command, headers, client)
      @uuid = uuid
      @command = command
      super(headers, DockerCloud::Client::ApiType::CONTAINER, client)
    end

    private

    def websocket_path
      @websocket_path ||= "/container/#{@uuid}/exec?command=#{@command}"
    end

    def root_path
      'app'
    end
  end
end
