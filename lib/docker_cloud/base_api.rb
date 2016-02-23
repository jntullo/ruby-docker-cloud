require 'rest-client'

module DockerCloud
  class BaseAPI
    attr_reader :headers

    BASE_API_PATH = 'https://cloud.docker.com/'
    API_VERSION = 'v1'

    def initialize(headers)
      @headers = headers
    end

    def url(path)
      BASE_API_PATH + '/' + path
    end

    def http_get(path, params={})
      query =  "?" + params.map { |k,v| "#{k}=#{v}"}.join("&")
      full_path = path
      full_path += query unless params.empty?
      response = RestClient.get(url(full_path), headers)
      JSON.parse(response, @json_opts)
    end

    def http_post(path, content={})
      response = RestClient.post(url(path), content.to_json, headers)
      JSON.parse(response, @json_opts)
    end

    def http_patch(path, content={})
      response = RestClient.patch(url(path), content.to_json, headers)
      JSON.parse(response, @json_opts)
    end

    def http_delete(path)
      response = RestClient.delete(url(path), headers)
      JSON.parse(response, @json_opts)
    end
  end
end