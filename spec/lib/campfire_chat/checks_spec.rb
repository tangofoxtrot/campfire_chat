require 'spec_helper'

describe CampfireChat::Checks do
  let(:notification) { double }
  describe '.process' do
    module AwesomeCheck
      extend CampfireChat::Checks

      def self.process_notification(notification)

      end
    end

    it 'sends the notification to all known Check objects' do
      AwesomeCheck.should_receive(:process_notification).with(notification)
      CampfireChat::Checks.process(notification)
    end

  end
end
