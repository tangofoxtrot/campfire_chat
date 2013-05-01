module CampfireChat
  class Message
    attr_reader :author, :body, :id
    def initialize(raw_message)
      @author = raw_message.user.name
      @body = raw_message.body
      @id = raw_message.id
    end

  end
end
