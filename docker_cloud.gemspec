# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'docker-cloud'
  spec.version       = '0.1.0'
  spec.authors       = ['jillianntulloADM']
  spec.email         = ['tullo_jillian@bah.com']

  spec.summary       = 'Ruby wrapper for the Docker Cloud HTTP REST API'
  spec.description   = 'Ruby implementation of the HTTP REST API'
  spec.homepage      = 'https://github.com/jntullo/ruby-docker-cloud'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rest-client', '~> 1.8.0'
  spec.add_runtime_dependency 'json', '~> 1.8.1'

  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'wrong', '~> 0.7.1'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'webmock', '~> 1.21'
end
