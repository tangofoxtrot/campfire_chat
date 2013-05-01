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
      @additional_messages = []
      @titles = []
      @important = false
      @error = false
    end

    def body
      (@additional_messages + [message.body]).join("\n")
    end

    def <<(more_message)
      @additional_messages << more_message
    end

    def add_title(another_title)
      @titles << another_title
    end

    def title
      @titles.join("\n")
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
