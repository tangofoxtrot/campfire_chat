module CampfireChat
  module Checks
    def self.extended(base)
      checks << base
    end

    def self.checks
      @checks ||= []
    end

    def self.process(notification)
      checks.each do |check|
        check.process_notification(notification)
      end
    end

  end
end
