require 'growl'
module CampfireChat
  module Notifier
    class Growl
      include Singleton

      def push(notification)
        growl.notify_ok notification.content, :sticky => notification.important?
      end

      def growl
        ::Growl
      end

    end
  end
end
