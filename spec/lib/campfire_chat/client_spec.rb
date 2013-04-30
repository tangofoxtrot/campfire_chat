require 'spec_helper'

describe CampfireChat::Client do
  let(:room) { double(:listen => []) }
  let(:config) { double(:room => 'room', :subdomain => 'sub', :token => 'token') }
  let(:tinder_double) { double(:rooms => {config.room => room}) }
  let(:client) { described_class.new(config) }

  before do
    Tinder::Campfire.stub(:new => tinder_double)
  end

  describe '#tinder' do
    it 'builds a new tender box object' do
      Tinder::Campfire.should_receive(:new).with(config.subdomain, :token => config.token)
      client.tinder
    end
  end

  describe '#messages' do
    it 'delegates to the tinder room' do
      room.should_receive(:listen)
      client.messages
    end

    it 'returns message objects' do
      message_hash = {:person=>"Bob", :message=>"something", :user_id=>"1", :id=>"123"}
      room.stub(:listen => [message_hash])
      client.messages.should have(1).message
      client.messages.first.should be_a(CampfireChat::Message)
    end
  end

end
