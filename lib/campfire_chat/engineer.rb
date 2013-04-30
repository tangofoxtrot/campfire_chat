module CampfireChat
  class Engineer
    attr_reader :name
    def initialize(attributes={})
      @name = attributes[:name]
    end

  end
end
