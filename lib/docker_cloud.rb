# helpers
require 'docker_cloud/helpers/services'
require 'docker_cloud/helpers/api'

# types
require 'docker_cloud/type'
require 'docker_cloud/availability_zone'
require 'docker_cloud/version'
require 'docker_cloud/container'
require 'docker_cloud/provider'
require 'docker_cloud/region'
require 'docker_cloud/node_type'
require 'docker_cloud/external_repository'
require 'docker_cloud/registry'
require 'docker_cloud/stack'
require 'docker_cloud/node'
require 'docker_cloud/node_cluster'
require 'docker_cloud/service'

# api clients
require 'docker_cloud/api/api'
require 'docker_cloud/api/provider_api'
require 'docker_cloud/api/region_api'
require 'docker_cloud/api/availability_zone_api'
require 'docker_cloud/api/node_type_api'
require 'docker_cloud/api/node_cluster_api'
require 'docker_cloud/api/node_api'
require 'docker_cloud/api/external_repository_api'
require 'docker_cloud/api/service_api'
require 'docker_cloud/api/container_api'
require 'docker_cloud/api/stack_api'
require 'docker_cloud/api/registry_api'

# ruby libs
require 'base64'

module DockerCloud
  class Client
    attr_reader :username

    class ApiType
      INFRASTRUCTURE = 'infra'.freeze
      REPOSITORY = 'repo'.freeze
      APPLICATION = 'app'.freeze
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
      @providers ||= DockerCloud::ProviderAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def regions
      @regions ||= DockerCloud::RegionAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def availability_zones
      @availability_zones ||= DockerCloud::AvailabilityZoneAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def node_types
      @node_types ||= DockerCloud::NodeTypeAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def node_clusters
      @node_clusters ||= DockerCloud::NodeClusterAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def nodes
      @nodes ||= DockerCloud::NodeAPI.new(headers, ApiType::INFRASTRUCTURE, self)
    end

    def registries
      @registries ||= DockerCloud::RegistryAPI.new(headers, ApiType::REPOSITORY, self)
    end

    def external_repositories
      @repositories ||=
        DockerCloud::ExternalRepositoryAPI.new(headers, ApiType::REPOSITORY, self)
    end

    def stacks
      @stacks ||= DockerCloud::StackAPI.new(headers, ApiType::APPLICATION, self)
    end

    def services
      @services ||= DockerCloud::ServiceAPI.new(headers, ApiType::APPLICATION, self)
    end

    def containers
      @containers ||= DockerCloud::ContainerAPI.new(headers, ApiType::APPLICATION, self)
    end

    private

    attr_reader :api_key

    def authorization
      @auth ||= ENV['DOCKERCLOUD_AUTH'] || "Basic #{Base64.strict_encode64(@username + ':' + api_key)}"
    end
  end
end
