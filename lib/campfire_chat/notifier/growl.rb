require 'growl'
module CampfireChat
  module Notifier
    class Growl
      include Singleton

      def push(notification)
        notify_ok notification
      end

      def growl
        ::Growl
      end

      private

      def notify_ok(notification)
        growl.notify notification.body, :title => notification.title, :sticky => notification.important?, :image => image_path('sr')
      end

      def image_path(image)
        File.join(File.expand_path(File.dirname(__FILE__)), '../', 'images', "#{image}.png")
      end

    end
  end
end
