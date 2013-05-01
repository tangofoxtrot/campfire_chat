require 'spec_helper'

describe CampfireChat::Monitor do
  let(:monitor) { described_class.instance }

  describe '#run' do

  end

  describe '#set_last_run_time' do
    it 'sets the last run time to now' do
      Time.stub(:now => 1)
      monitor.set_last_run_time
      monitor.last_run_time.should == 1
    end

  end

  describe '#check_client?' do
    context 'when the last_run_time is nil' do
      before { monitor.last_run_time = nil }
      it 'returns true' do
        monitor.should be_check_client
      end
    end

    context 'when the last_run_time is less than time.now' do
      before { monitor.last_run_time = Time.now - 1000 }
      it 'returns true' do
        monitor.should be_check_client
      end
    end

    context 'when the last_run_time has not exceeded the retry' do
      before { monitor.last_run_time = Time.now - described_class.retry_time + 1  }
      it 'returns false' do
        monitor.should_not be_check_client
      end
    end

    context 'when the last_run_time is more than time.now' do
      before { monitor.last_run_time = Time.now + 100 }
      it 'returns false' do
        monitor.should_not be_check_client
      end
    end

  end

  describe '#check_messages' do
    let(:notifier) { double(:push) }
    before do
      monitor.stub(:notifier => notifier)
    end

    it 'loops over the messages and prepares the notification' do
      notification = double
      new_message = double
      monitor.client.stub(:messages => [new_message])
      monitor.should_receive(:prepare_notification).with(new_message).and_return(notification)
      notifier.should_receive(:push).with(notification)
      monitor.check_messages
    end
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
