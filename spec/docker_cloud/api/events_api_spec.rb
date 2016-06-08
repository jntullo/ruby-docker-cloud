require 'spec_helper'

describe DockerCloud::EventsAPI do
  subject { DockerCloud::EventsAPI.new(headers, type, client) }
  let(:type) { 'container' }
  let(:headers) { {} }
  let(:client) { instance_double(DockerCloud::Client) }
  let(:faye_client) { instance_double(Faye::WebSocket::Client, on: nil) }

  describe '#websocket' do
    it 'initializes Faye with the correct URL' do
      expect(Faye::WebSocket::Client).to receive(:new).with('wss://ws.cloud.docker.com/api/audit/v1/events', nil, ping: 240, headers: headers).and_return(faye_client)

      subject.websocket
    end
  end
end
