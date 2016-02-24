require 'docker_cloud/version'
require 'docker_cloud/base_api'
require 'docker_cloud/provider_api'
require 'docker_cloud/region_api'
require 'docker_cloud/availability_zone_api'
require 'docker_cloud/node_type_api'
require 'docker_cloud/node_cluster_api'
require 'docker_cloud/node_api'
require 'docker_cloud/external_repository_api'
require 'docker_cloud/service_api'
require 'docker_cloud/container_api'
require 'docker_cloud/stack_api'

module DockerCloud
  class Client
    attr_reader :username, :api_key

    class ApiType
      INFRASTRUCTURE =  'infra'
      REPOSITORY =  'repo',
      APPLICATION =  'app'
    end

    def initialize(username, api_key)
      @username = username
      @api_key = api_key
    end

    def headers
      {
          'Authorization' => authorization,
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
      }
    end

    def providers
      @providers ||= DockerCloud::ProviderAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def regions
      @regions ||= DockerCloud::RegionAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def availability_zones
      @availability_zones ||= DockerCloud::AvailabilityZoneAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def node_types
      @node_types ||= DockerCloud::NodeTypeAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def node_clusters
      @node_clusters ||= DockerCloud::NodeClusterAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def nodes
      @nodes ||= DockerCloud::NodeAPI.new(headers, ApiType::INFRASTRUCTURE)
    end

    def external_repositories
      @repositories ||= DockerCloud::ExternalRepositoryAPI.new(headers, ApiType::REPOSITORY)
    end

    def stacks
      @stacks ||= DockerCloud::StackAPI.new(headers, ApiType::APPLICATION)
    end

    def services
      @services ||= DockerCloud::ServiceAPI.new(headers, ApiType::APPLICATION)
    end

    def containers
      @containers ||= DockerCloud::ContainerAPI.new(headers, ApiType::APPLICATION)
    end

    private

    def authorization
      @auth ||= "Basic #{Base64.strict_encode64(@username + ':' + @api_key)}"
    end
  end
end
