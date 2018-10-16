# This is the class Player who define the name 's player
class Player
    attr_accessor :name
    # method who create the name's player
    def initialize(name)
        @name = name.upcase   
    end

    # change the statut player to winner
    def statut_player_winner
        puts "you're the winner"
    end
end