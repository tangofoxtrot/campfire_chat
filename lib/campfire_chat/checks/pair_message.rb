module CampfireChat
  module Checks
    module PairMessage
      def self.process_notification(notification)
        CampfireChat.config.pairs.each do |pair|
          if notification.message.body.include?(pair.name)
            notification.important!
          end
        end
      end
    end
  end
end
