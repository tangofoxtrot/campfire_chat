require 'spec_helper'

describe CampfireChat::Checks::PairMessage do
  let(:message) { double(:body => 'Fred you broke the build') }
  let(:notification) { double(:message => message, :important! => true, :<< => nil)}
  let(:config) { double(:pairs => [double(:name => 'Bob')]) }
  before do
    CampfireChat.stub(:config => config)
  end

  describe '.process_notification' do
    context 'when the notification contains a name in the pairs' do
      before do
        config.pairs << double(:name => 'Fred')
      end
      it 'flags the notification as important' do
        notification.should_receive(:important!)
        CampfireChat::Checks::PairMessage.process_notification(notification)
      end

      it 'adds additional messages to the notification' do
        notification.should_receive(:<<).with("Fred: Someone has mentioned your name")
        CampfireChat::Checks::PairMessage.process_notification(notification)
      end
    end

    context 'when the notification does not contain a name in the pairs' do
      it 'does not flag the notification as important' do
        notification.should_not_receive(:important!)
        CampfireChat::Checks::PairMessage.process_notification(notification)
      end
    end
  end
end
