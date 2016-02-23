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

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jntullo/ruby-docker-cloud. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

