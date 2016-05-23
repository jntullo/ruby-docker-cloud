require 'spec_helper'

describe DockerCloud::ContainerStreamAPI do
  subject { DockerCloud::ContainerStreamAPI.new(uuid, command, headers, client) }
  let(:uuid) { '1234' }
  let(:command) { 'ls' }
  let(:headers) { {} }
  let(:client) { instance_double(DockerCloud::Client) }
  let(:faye_client) { instance_double(Faye::WebSocket::Client, on: nil) }

  describe '#websocket' do
    it 'initializes Faye with the correct URL' do
      expect(Faye::WebSocket::Client).to receive(:new).with('wss://ws.cloud.docker.com/api/app/v1/container/1234/exec?command=ls', nil, ping: 240, headers: headers).and_return(faye_client)

      subject.websocket
    end
  end

  # NOTE: We're testing the class our class has to inherit from here
  describe '#run!' do
    before do
      # Set a no-op listener because `run!` requires at least
      # one listener to exist.
      subject.on(:message) {}
    end

    it 'creates a websocket using faye' do
      expect(Faye::WebSocket::Client).to receive(:new).with('wss://ws.cloud.docker.com/api/app/v1/container/1234/exec?command=ls', nil, ping: 240, headers: headers).and_return(faye_client)

      subject.run! { EM.add_timer(0.5) { EventMachine.stop } }
    end

    it 'invokes our optional blocks' do
      received = false
      subject.run! do
        received = true
        EM.add_timer(0.5) { EventMachine.stop }
      end
      expect(received).to be_truthy
    end
  end
end
