require 'spec_helper'

describe CampfireChat::Monitor do
  let(:monitor) { described_class.instance }

  describe '#run' do
  end

  describe '#prepare_notification' do
    it 'builds a new notification object' do
      message = double
      CampfireChat::Notification.should_receive(:build).with(message)
      monitor.prepare_notification(message)
    end
  end

  describe '#notifier' do
    it 'returns the notifier instance' do
      monitor.notifier.should be_a(CampfireChat::Notifier::Growl)
    end
  end

  describe '#client' do
    it 'returns the client instance' do
      monitor.client.should be_a(CampfireChat::Client)
    end
  end
end
