require_relative 'board.rb'

#création de la classe player
class Player
    attr_accessor :name, :sym 
    def initialize(name)
      @name = name
    end
end