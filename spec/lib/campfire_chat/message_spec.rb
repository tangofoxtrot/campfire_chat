require 'spec_helper'

describe CampfireChat::Message do
  let(:raw_message) { build_message("Pete", "something again") }
  let(:message) { described_class.new(raw_message) }

  describe '#body' do
    it 'returns the content of the message' do
      message.body.should == raw_message.body
    end
  end

  describe '#author' do
    it 'returns the author of the message' do
      message.author.should == raw_message.user.name
    end
  end

  describe '#id' do
    it 'returns the id of the message' do
      message.id.should == raw_message.id
    end
  end
end
