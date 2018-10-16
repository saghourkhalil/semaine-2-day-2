class Board
    attr_accessor :spaces
    #création de l'array
        def initialize
            @spaces = Array.new(9,"-")
        end
      #génére board
          def generate_board 
            board = ""
            (0..8).step(3) do |i|
              board += "[ #{@spaces[i]} ][ #{@spaces[i + 1]} ][ #{@spaces[i + 2]} ]\n"
            end
            puts board + "\n"
          end
    
        # ajoute un symbole à une certaine position
        def add_symbol(position, symbol) 
          @spaces[position] = symbol
        end
    
        # vérifie si un certain espace est pris
        def to_s(position) 
          return @spaces[position] == "X" || @spaces[position] == "O"
        end
end