require 'spec_helper'

describe CampfireChat::Client do
  let(:room) { double(:recent => []) }
  let(:config) { double(:room => 'room', :subdomain => 'sub', :token => 'token') }
  let(:tinder_double) { double(:find_room_by_name => room) }
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

    it 'returns message objects' do
      room.stub(:recent => [build_message("Bob", 'another')])
      client.messages.first.should be_a(CampfireChat::Message)
    end

    it 'stores the last ID of the previous request and only returns the new messages' do
      raw_messages = [
        build_message("Bob", "something more"),
        build_message("Fred", "something else"),
        build_message("Pete", "something again")
      ]
      room.stub(:recent => raw_messages)
      client.last_message_id = raw_messages.first.id
      messages = client.messages
      messages.should have(2).message
      messages.first.id.should == raw_messages[1].id
      client.last_message_id.should == raw_messages[2].id
    end

    it 'does not store a nil ID if there are no new messages' do
      messages = [
        build_message("Bob", "something more"),
      ]
      room.stub(:recent => messages)
      client.last_message_id = messages.first.id
      client.last_message_id.should == messages.first.id
    end

    it 'excludes non TextMessage messages' do
      raw_messages = [
        build_message("Bob", "something more"),
        build_message("Fred", "something else", 'RoomEnter'),
      ]
      room.stub(:recent => raw_messages)
      messages = client.messages
      messages.should have(1).message
    end
  end

end
