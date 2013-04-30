require 'spec_helper'

describe CampfireChat::Notifier::Growl do
  let(:notification) { double(:content => 'some message', :important? => false, :error? => false) }

  let(:notifier) { described_class.instance }

  describe '#push' do
    it 'delegates to Growl' do
      ::Growl.should_receive(:notify_ok).with(notification.content, :sticky => notification.important?)
      notifier.push notification
    end
  end

end
