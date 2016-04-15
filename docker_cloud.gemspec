# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'docker_cloud'
  spec.version       = DockerCloud::VERSION
  spec.authors       = ['Jillian Tullo', 'Richard Adams', 'Pat Leamon']
  spec.email         = ['jillian.tullo@gmail.com']

  spec.summary       = 'Ruby wrapper for the Docker Cloud HTTP REST API'
  spec.description   = 'Ruby implementation of the HTTP REST API'
  spec.homepage      = 'https://github.com/jntullo/ruby-docker-cloud'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rest-client', '~> 1.8.0'
  spec.add_runtime_dependency 'json', '~> 1.8.1'
  spec.add_runtime_dependency 'faye-websocket', '~> 0.10.3'


  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'wrong', '~> 0.7.1'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'webmock', '~> 1.21'
end
