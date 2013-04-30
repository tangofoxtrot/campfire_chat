module CampfireChat
  class Message
    attr_reader :author, :body, :id
    def initialize(attributes)
      @author = attributes[:person]
      @body = attributes[:message]
      @id = attributes[:id]
    end

  end
end
