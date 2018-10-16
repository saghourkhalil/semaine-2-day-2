require_relative 'borderCase.rb'
# This class is to do the link between Boardcase and the game
class Board
    attr_accessor :tab
    # initilization of the board game
    def initialize
        @tab = [
        a1 = BoardCase.new("[ ]", 0),
        caze_to_play2 = BoardCase.new("[ ]", 1),
        caze_to_play3 = BoardCase.new("[ ]", 2),
        caze_to_play4 = BoardCase.new("[ ]", 3),
        caze_to_play5 = BoardCase.new("[ ]", 4),
        caze_to_play6 = BoardCase.new("[ ]", 5),
        caze_to_play7 = BoardCase.new("[ ]", 6),
        caze_to_play8 = BoardCase.new("[ ]", 7),
        caze_to_play9 = BoardCase.new("[ ]", 8)
        ]
    end
end