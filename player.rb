require_relative 'board.rb'

class Player
    attr_accessor :name, :sym 
    def initialize(name)
      @name = name
    end
end