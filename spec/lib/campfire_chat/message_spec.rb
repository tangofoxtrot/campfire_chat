require 'spec_helper'

describe CampfireChat::Message do
  let(:message_attributes) { {:person=>"Bob", :message=>"something", :user_id=>"1", :id=>"123"} }
  let(:message) { described_class.new(message_attributes) } 

  describe '#body' do
    it 'returns the content of the message' do
      message.body.should == message_attributes[:message]
    end
  end

  describe '#author' do
    it 'returns the author of the message' do
      message.author.should == message_attributes[:person]
    end
  end

  describe '#id' do
    it 'returns the id of the message' do
      message.id.should == message_attributes[:id]
    end
  end
end
