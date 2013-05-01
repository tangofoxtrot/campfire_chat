module CampfireChat
  class Notification
    attr_reader :message

    def self.build(message)
      notification = new(message)
      CampfireChat::Checks.process(notification)
      notification
    end

    def initialize(message)
      @message = message
      @important = false
      @error = false
    end

    def body
      message.body
    end

    def important?
      @important
    end

    def important!
      @important = true
    end

    def error!
      @error = true
    end

    def error?
      @error
    end
  end
end
