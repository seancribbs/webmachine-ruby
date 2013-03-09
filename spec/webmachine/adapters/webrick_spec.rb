require "spec_helper"
require "support/adapter_lint"

describe Webmachine::Adapters::WEBrick do
  it_should_behave_like :adapter_lint do
    let(:adapter_options) { { :Logger => WEBrick::Log.new(STDERR, WEBrick::Log::DEBUG) } }

    it "should set Server header" do
      response = client.request(Net::HTTP::Get.new("/test"))
      response["Server"].should match(/Webmachine/)
      response["Server"].should match(/WEBrick/)
    end
  end
end
