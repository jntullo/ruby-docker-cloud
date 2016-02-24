require 'rest-client'

module DockerCloud
  class BaseAPI
    attr_reader :headers, :type, :client

    BASE_API_PATH = 'https://cloud.docker.com/api'
    API_VERSION = 'v1'

    def initialize(headers, type, client)
      @headers = headers
      @type = type
      @client = client
    end

    def url(path)
      BASE_API_PATH + '/' + @type + '/' + API_VERSION + path
    end

    def http_get(path, params={})
      query =  "?" + params.map { |k,v| "#{k}=#{v}"}.join("&")
      full_path = path
      full_path += query unless params.empty?
      response = RestClient.get(url(full_path), headers)
      parse(response)
    end

    def http_post(path, content={})
      response = RestClient.post(url(path), content.to_json, headers)
      parse(response)
    end

    def http_patch(path, content={})
      response = RestClient.patch(url(path), content.to_json, headers)
      parse(response)
    end

    def http_delete(path)
      response = RestClient.delete(url(path), headers)
      parse(response)
    end

    def parse(response)
      hash = JSON.parse(response, symbolize_names: true)
      hash.delete(:meta)
      hash[:objects].nil? ? hash : hash[:objects]
    end
  end
end