require 'singleton'
require "campfire_chat/version"
require 'campfire_chat/engineer'
require 'campfire_chat/client'
require 'campfire_chat/configuration'
require 'campfire_chat/message'
require 'campfire_chat/monitor'
require 'campfire_chat/checks'
require 'campfire_chat/checks/pair_message'
require 'campfire_chat/notification'
require 'campfire_chat/notifier/growl'

module CampfireChat
  def self.config
    @config ||= Configuration.build
  end
  # Your code goes here...
end
