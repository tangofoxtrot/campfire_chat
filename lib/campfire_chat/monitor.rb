module CampfireChat
  class Monitor
    include Singleton
    attr_accessor :last_run_time

    def self.retry_time
      30
    end

    def self.sleep_time
      retry_time / 2
    end

    def self.run
      instance.run
    end

    def run
      loop do
        if check_client?
          check_messages
          set_last_run_time
          sleep self.class.sleep_time
        end
      end
    end

    def check_messages
      client.messages.each do |message|
        notification = prepare_notification(message)
        notifier.push(notification)
      end
    end

    def set_last_run_time
      self.last_run_time = Time.now
    end

    def check_client?
      return true if last_run_time.nil?
      last_run_time + self.class.retry_time < Time.now
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
