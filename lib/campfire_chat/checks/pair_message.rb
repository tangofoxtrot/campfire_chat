module CampfireChat
  module Checks
    module PairMessage
      extend CampfireChat::Checks

      def self.process_notification(notification)
        CampfireChat.config.pairs.each do |pair|
          if notification.message.body.include?(pair.name)
            notification.important!
            notification << message(pair)
          end
        end
      end

      def self.message(pair)
        "#{pair.name}: Someone has mentioned your name"
      end
    end
  end
end
