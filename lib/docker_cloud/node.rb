module DockerCloud
  class Node < DockerCloud::BaseObject
    # TODO: GET THE AVAILABILITY ZONE
    def az_name; @az_name ||= info[:availability_zone]; end
    def uui; info[:uuid]; end
    def resource_uri; info[:resource_uri]; end
    def external_fqdn; info[:external_fqdn]; end
    def state; info[:state]; end

    # TODO: GET THE NODE CLUSTER
    def node_cluster; info[:node_cluster]; end
    # TODO: GET THE NODE TYPE
    def node_type; info[:node_type]; end
    def region; info[:region]; end
    def docker_execdriver; info[:docker_execdriver]; end
    def docker_version; info[:docker_version]; end
    def cpu; info[:cpu]; end
    def disk; info[:disk]; end
    def memory; info[:memory]; end
    def last_metric; info[:memory]; end
    def num_of_containers; info[:current_num_container]; end
    def last_seen; info[:last_seen]; end
    def public_ip; info[:public_ip]; end
    def tunnel; info[:tunnel]; end
    def deployed_date; info[:deployed_datetime]; end
    def destroyed_date; info[:destroyed_datetime]; end
    def tags; info[:tags]; end
    def nickname; info[:nickname]; end
    def last_metric; @last_metric ||= LastMetric.new(info[:last_metric]); end

    class LastMetric
      attr_accessor :cpu, :disk, :memory
      def initialize(response)
        @cpu = response[:cpu]
        @disk = response[:disk]
        @memory = response[:memory]
      end
    end
  end
end