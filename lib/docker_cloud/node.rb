module DockerCloud
  class Node < DockerCloud::Type
    def availability_zone
      @az ||= client.availability_zones.get_from_uri(info[:availability_zone]) unless info[:availability_zone].nil?
    end

    def resource_uri
      info[:resource_uri]
    end

    def external_fqdn
      info[:external_fqdn]
    end

    def state
      info[:state]
    end

    # def node_cluster; info[:node_cluster]; end
    def node_cluster
      @node_cluster ||= client.node_clusters.get_from_uri(info[:node_cluster]) unless info[:node_cluster].nil?
    end

    # def node_type; info[:node_type]; end
    def node_type
      @node_type ||= client.node_type.get_from_uri(info[:node_type]) unless info[:node_type].nil?
    end

    # def region; info[:region]; end
    def region
      @region ||= client.regions.get_from_uri(info[:region]) unless info[:region].nil?
    end

    def docker_execdriver
      info[:docker_execdriver]
    end

    def docker_version
      info[:docker_version]
    end

    def cpu
      info[:cpu]
    end

    def disk
      info[:disk]
    end

    def memory
      info[:memory]
    end

    def num_of_containers
      info[:current_num_container]
    end

    def last_seen
      info[:last_seen]
    end

    def public_ip
      info[:public_ip]
    end

    def tunnel
      info[:tunnel]
    end

    def deployed_date
      info[:deployed_datetime]
    end

    def destroyed_date
      info[:destroyed_datetime]
    end

    def tags
      info[:tags]
    end

    def nickname
      info[:nickname]
    end

    def last_metric
      @last_metric ||= LastMetric.new(info[:last_metric])
    end

    class LastMetric
      attr_accessor :cpu, :disk, :memory
      def initialize(response)
        @cpu = response[:cpu]
        @disk = response[:disk]
        @memory = response[:memory]
      end
    end

    def health_check
      api.health_check(uuid)
    end

    def terminate
      api.terminate(uuid)
    end

    def docker_upgrade
      api.docker_upgrade(uuid)
    end

    private

    def api
      client.nodes
    end
  end
end
