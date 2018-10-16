require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'


class TicTacToe
    attr_accessor :name1, :name2, :game_data

    def initialize
      welcome_screen
      game_loop
    end

    def welcome_screen 
  
      puts "||BIENVENUE||\n\n\n"
      print "Player 1's name: "
      @name1 = gets.chomp
      puts " "
      print "Player 2's name: "
      @name2 = gets.chomp
      puts " "
    end

    def game_loop 
      game_start
      play_again
    end

    def game_start 
      board = Board.new
      player1, player2 = Player.new(@name1), Player.new(@name2)
      game = Game.new(player1, player2, board)
    end


    def play_again
      input = nil
      until input == "Y" or input == "N"
        puts "tu veux rejouer? (Y/N): "
        input = gets.chomp.upcase
      end
      case input
      when "Y"
        game_start
      when "N"
        puts "BYE bye!"
      end
    end
end

TicTacToe.new