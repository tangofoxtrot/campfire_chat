require 'tinder'
module CampfireChat
  class Client
    attr_reader :config
    def initialize(config = CampfireChat.config)
      @config = config
    end

    def tinder
      @tinder ||= Tinder::Campfire.new(config.subdomain, :token => config.token)
    end

    def messages
      tinder.rooms[config.room].listen.map {|m| build_message(m) }
    end

    private

    def build_message(msg_hash)
      CampfireChat::Message.new(msg_hash)
    end

  end
end
