module CampfireChat
  class Monitor
    include Singleton

    def check_messages
      client.messages.each do |message|
        notification = prepare_notification(message)
        notifer.push(notification)
      end
    end

    def prepare_notification(message)
      CampfireChat::Notification.build(message)
    end

    def client
      @client ||= CampfireChat::Client.new
    end

    def notifier
      @notifier ||= CampfireChat::Notifier::Growl.instance
    end
  end
end
