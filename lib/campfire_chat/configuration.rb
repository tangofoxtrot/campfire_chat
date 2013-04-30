require 'yaml'
module CampfireChat
  class Configuration
    attr_reader :token, :room, :subdomain, :pairs

    def self.build(path = nil)
      path ||= Pathname.new(ENV['HOME']).join('.campfire.yml')
      new load_config(path)
    end

    def self.load_config(path)
      conf = YAML.load_file(path) || {}
      Hash[conf.map{ |k, v| [k.to_sym, v] }]
    rescue Errno::ENOENT, TypeError
      {}
    end

    def initialize(attrs={})
      @token = attrs[:token]
      @subdomain = attrs[:subdomain]
      @room = attrs[:room]
      @pairs = []
    end

    def add_pair(name)
      pairs << CampfireChat::Engineer.new(:name => name)
    end

  end
end
