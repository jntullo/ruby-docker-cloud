require 'spec_helper'

describe DockerCloud do
  it 'has a version number' do
    expect(DockerCloud::VERSION).not_to be nil
  end
end

describe DockerCloud::Client do
  describe "#headers" do
    subject { described_class.new('foo', 'bar').headers }

    context "Authorization header" do
      it "base64 encodes username and api_key" do
        expect(subject["Authorization"]).to eq("Basic Zm9vOmJhcg==")
      end
    end
  end
end
