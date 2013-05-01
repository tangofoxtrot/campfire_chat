require 'spec_helper'

describe CampfireChat::Notification do
  let(:message) { double(:body => 'the body') }
  let(:notification) { described_class.new(message) }

  describe '#important?' do
    context 'when default' do
      it 'returns false' do
        notification.should_not be_important
      end
    end

    context 'when marked as important' do
      it 'returns true' do
        notification.important!
        notification.should be_important
      end
    end
  end

  describe '#error?' do
    context 'when default' do
      it 'returns false' do
        notification.should_not be_error
      end
    end

    context 'when marked as error' do
      it 'returns true' do
        notification.error!
        notification.should be_error
      end
    end
  end

  describe '#body' do
    it 'returns the message body' do
      notification.body.should == message.body
    end
  end

  describe '.build' do
    it 'instantiates a new notification from the message' do
      notification = described_class.build(message)
      notification.message.should == message
    end

    it 'passes the notification into the Checks.process method' do
      notification = double
      described_class.stub(:new => notification)
      CampfireChat::Checks.should_receive(:process).with(notification)
      described_class.build(message)
    end
  end
end
