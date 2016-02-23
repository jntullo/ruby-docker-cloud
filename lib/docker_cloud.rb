require 'docker_cloud/version'
require 'docker_cloud/base_api'
require 'docker_cloud/provider_api'

module DockerCloud
  class Client
    attr_reader :username, :api_key

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
      @providers ||= DockerCloud::ProviderAPI.new(headers)
    end

    private

    def authorization
      @auth ||= "Basic #{Base64.strict_encode64(@username + ':' + @api_key)}"
    end
  end
end
