# DockerCloud

This gem is a ruby implementation of the [Docker Cloud HTTP REST API](https://docs.docker.com/apidocs/docker-cloud/#introduction).

DockerCloud is not compatible with the TutumAPI. Credit to [ruby-tutum](https://github.com/tutumcloud/ruby-tutum) which much of this
code has been based off of.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docker_cloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker_cloud

## Usage

Getting Started:
```ruby
# Authenticate your ruby client with a usernamme and api_key
client = DockerCloud::Client.new(username, api_key)

# Providers
provider = client.providers

# List all providers
provider.all

# Get a provider by name
provider.get('digitalocean')

# Regions
regions = client.regions

# List all regions
regions.all

# Get a particular region
# regions.get(<provider_name>, <region_name>)
# example:
regions.get('softlayer', 'ams03')

# Availability Zones
az = client.availability_zones

# List all AZ
az.all

# Get a particular AZ
# az.get(<provider name>, <region name>, <az name>)
# example:
az.get('softlayer', 'ams03', 'ap-northeast-1a')

# Node Types
node_types = client.node_types

# List all Node Types
node_types.all

# Get a node type
# node_types.get(<provider_name>, <name>)
node_types.get('softlayer', '1x2.0GHzCore-2GB')

# Events
events = client.events

# Event listeners
events.on(:open) do |event|
  puts "OPEN"
end

events.on(:close) do |event|
  puts "Code: #{event.code}"
  puts "Reason: #{event.reason}"
end

events.on(:error) do |event|
  puts "Message: #{event.message}"
end

events.on(:message) do |event|
  puts "Type: #{event.type}"
  puts "Action: #{event.action}"
  puts "Parents: #{event.parents}"
  puts "Resource URI: #{event.resource_uri}"
  puts "State: #{event.state}"
  puts "UUID: #{event.uuid}"
  puts "Datetime: #{event.datetime}"
end

events.run! # This will start an EventMachine event loop

```

## Running specs

```
rake spec
```

if you are using docker compose then:

```
docker-compose build
docker-compose run ruby_docker_cloud
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jntullo/ruby-docker-cloud. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
