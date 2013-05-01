require 'tinder'
module CampfireChat
  class Client
    attr_reader :config
    attr_accessor :last_message_id
    def initialize(config = CampfireChat.config)
      @config = config
    end

    def tinder
      @tinder ||= Tinder::Campfire.new(config.subdomain, :token => config.token)
    end

    def messages
      recent_messages = room.recent.select {|x| x.type == 'TextMessage' }
      recent_messages = recent_messages.select {|x| x.id.to_i > last_message_id.to_i }.map {|m| build_message(m) }
      self.last_message_id = recent_messages.last.id unless recent_messages.empty?
      recent_messages
    end

    private

    def build_message(msg)
      CampfireChat::Message.new(msg)
    end

    def room
      @room ||= tinder.find_room_by_name(config.room)
    end

  end
end
