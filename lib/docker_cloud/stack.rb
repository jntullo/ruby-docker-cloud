module DockerCloud
  class Stack < DockerCloud::BaseObject
    def uuid; info[:uuid]; end
    def resource_uri; info[:uui]; end
    def name; info[:name]; end
    def state; info[:state]; end
    def synchronized; info[:synchronized]; end
    # todo: GET THE SERVICES
    def services; info[:services]; end
    def deployed_date; info[:deployed_endatetime]; end
    def destroyed_date; info[:destroyed_datetime]; end
    def nickname; info[:nickname]; end
  end
end