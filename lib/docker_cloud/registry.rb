module DockerCloud
  class Registry < DockerCloud::BaseObject
    def resource_uri; info[:resource_uri]; end
    def name; info[:name]; end
    def host; info[:host]; end
    def docker_registry?; info[:is_docker_registry]; end
    def is_ssl; info[:is_ssl]; end
    def port; info[:port]; end
  end
end