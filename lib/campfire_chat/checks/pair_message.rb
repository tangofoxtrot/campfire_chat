module CampfireChat
  module Checks
    module PairMessage
      extend CampfireChat::Checks

      def self.process_notification(notification)
        CampfireChat.config.pairs.each do |pair|
          if notification.message.body.include?(pair.name)
            notification.important!
            notification.add_title title(pair)
          end
        end
      end

      def self.title(pair)
        "#{pair.name}:"
      end
    end
  end
end
