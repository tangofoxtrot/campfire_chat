require 'spec_helper'

describe CampfireChat::Notifier::Growl do
  let(:notification) { double(:body => 'some message', :title => 'some title', :important? => false, :error? => false) }

  let(:notifier) { described_class.instance }

  describe '#push' do
    it 'delegates to Growl' do
      ::Growl.should_receive(:notify).with(notification.body, :title => notification.title, :sticky => notification.important?, :image => anything)
      notifier.push notification
    end
  end

end
