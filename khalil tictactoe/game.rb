require_relative 'board.rb'
require_relative 'player.rb'

class Game
    attr_accessor :player1, :player2, :turn, :board
     @@winning_positions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    def initialize(player1, player2, board)
  #initialise les objets externes utilisés par cette classe.
      @player1 = player1
      @player2 = player2
      @board = board
#initialise les données pour le jeu en cours
      @current_turn = 1
      @first_turn = ""
      @winner = ""
      play
    end
#flux de jeu principal
    def play
      pick_first_turn
      allocate_symbols
      take_turns
    end
# un joueur est choisi au hasard pour commencer
    def pick_first_turn
      random = Random.new
      first_turn = random.rand(0..1)
      case first_turn
      when 0
        @first_turn = @player1.name
      when 1
        @first_turn = @player2.name
      end
      puts "#{@first_turn} est le premier!\n"
    end
#alloue les symboles aux joueurs
    def allocate_symbols
      @player1.sym = "X"
      @player2.sym = "O"
    end
#Nombre de tours entre les joueurs en fonction de celui qui a commencé le premier et du numéro du tour actuel
    def take_turns 
      until draw? || @winner != ""
        if @first_turn == @player1.name
          (@current_turn.even?) ? turn(@player2) : turn(@player1)
        elsif @first_turn == @player2.name
          (@current_turn.even?) ? turn(@player1) : turn(@player2)
        end
      end
#checks si le jeu est un match nul après la fin de la boucle
      puts "Match nul!" if draw? 
    end
#c'est le tour d'un joueur
    def turn(player) 
      puts "au tour de : #{@current_turn}:"
      puts "Maintenant joue la!\n"
      @board.generate_board
      @board.add_symbol(get_valid_position(player), player.sym)
      announce_win(player)
      @current_turn += 1
    end
#get une entrée valide du joueur.
    def get_valid_position(player) 
      input = 0
      until valid_input?(input)
        print "#{player.name}, choisie un nombre entre (1-9): "
        input = gets.chomp.to_i
        print "pas valide! " unless valid_input?(input)
        puts "nombre non compris entre 1-9" unless (input > 0 && input < 10)
        puts "Celule prise." if @board.to_s(input - 1)
      end
      input - 1
    end
# check qui a gagner
    def announce_win(player)
      check_winner(player)
      if @winner == player.name
        puts "#{player.name}  est le gagnants!"
      end
    end
#checks si le jeu est un match nul
    def draw?
      (@current_turn == @board.spaces.length) && (@winner == "")
    end
#si un joueur est gagnant, l'instance @winner var est définie sur ce joueur
    def check_winner(player)
      @@winning_positions.each do |triple|
        @winner = player.name if triple.all? { |a| @board.spaces[a] == player.sym }
      end
    end
#checks si l'entrée répond aux conditions
    def valid_input?(input)
        return input > 0 && input < 10 && !@board.to_s(input - 1)
      end
end
