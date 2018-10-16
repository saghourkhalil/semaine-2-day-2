require 'colorize'
require_relative 'player.rb'
require_relative 'border.rb'

#class who define who is the winner and display the game
class Game

    
    attr_accessor :game
    def initialize
        @game = Board.new
        @player1 = Player.new("")
        @player2 = Player.new("")
    end

    #check le joueur 1 si il a gagne
    def check_if_O
        if @game.tab[0].caze == "[O]" && @game.tab[1].caze == "[O]" && @game.tab[2].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[0].caze == "[O]" && @game.tab[3].caze == "[O]" && @game.tab[6].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[0].caze == "[O]" && @game.tab[4].caze == "[O]" && @game.tab[8].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[1].caze == "[O]" && @game.tab[4].caze == "[O]" && @game.tab[7].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[2].caze == "[O]" && @game.tab[5].caze == "[O]" && @game.tab[8].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[2].caze == "[O]" && @game.tab[4].caze == "[O]" && @game.tab[6].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[3].caze == "[O]" && @game.tab[4].caze == "[O]" && @game.tab[5].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        elsif @game.tab[6].caze == "[O]" && @game.tab[7].caze == "[O]" && @game.tab[8].caze == "[O]"
            puts "#{@player1.name} a gagné"
            return play_again
        end
    end

    #check le joueur 2 si il a gagner
    def check_if_X
        if @game.tab[0].caze == "[X]" && @game.tab[1].caze == "[X]" && @game.tab[2].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[0].caze == "[X]" && @game.tab[3].caze == "[X]" && @game.tab[6].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[0].caze == "[X]" && @game.tab[4].caze == "[X]" && @game.tab[8].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[1].caze == "[X]" && @game.tab[4].caze == "[X]" && @game.tab[7].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[2].caze == "[X]" && @game.tab[5].caze == "[X]" && @game.tab[8].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[2].caze == "[X]" && @game.tab[4].caze == "[X]" && @game.tab[6].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[3].caze == "[X]" && @game.tab[4].caze == "[X]" && @game.tab[5].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        elsif @game.tab[6].caze == "[X]" && @game.tab[7].caze == "[X]" && @game.tab[8].caze == "[X]"
            puts "#{@player2.name} a gagné"
            return play_again
        end
    end

    #demande au joueur1 d'entrer un chiffre
    def answer_player1
        puts "---------#{@player1.name}, entre un nombre entre 1 et 9---------".green
        case_to_play1 = (gets.chomp.to_i) - 1
        if @game.tab[case_to_play1].caze != "[ ]"
            puts "cette case est déja joué. Rejoue.".red
            return answer_player1
        end
        return @game.tab[case_to_play1].set_caze_to_O
    end

    #demande au joueur1 d'entrer un chiffre
    def answer_player2
        puts "---------#{@player2.name}, entre un nombre entre 1 et 9---------".green
        case_to_play2 = (gets.chomp.to_i) - 1
        if @game.tab[case_to_play2].caze != "[ ]"
            puts "cette case est déja joué. Rejoue.".red
            return answer_player2
        end
        return @game.tab[case_to_play2].set_caze_to_X
    end
    
    #reinitialise le morpion
    def initialisation_morpion
        @game.tab.each do |i| i.set_caze_to_white end
    end

    #affiche le morpion
    def display_morpion
        @game.tab.each do |the_caze|
            if the_caze.nb_caze % 3 == 0
                puts ""
            end 
            print the_caze.caze.blue
        end
        puts ""
    end

    # demande à l'utilisateur s'il veut jouer à nouveau
    def play_again
        input = nil
        until input == "Y" or input == "N"
        puts "tu veux rejouer? (Y/N): "
        input = gets.chomp.upcase
        end
        case input
        when "Y"
            initialisation_morpion
        return play_game
        when "N"
            puts "Aurevoir..."
        exit
        end
    end
    
    #lance le jeu
    def play_game
        puts "---------Bienvenue to the TIC-TAC-TOE Game---------\n\n\n".blue
        puts "Entre le nom du player 1"
        @player1.name = gets.chomp.upcase.blue
        puts "Entre le nom du player 2"
        @player2.name = gets.chomp.upcase.green
        i = 0
        while i < 5
            puts "---------Manche #{i + 1}---------".red
            display_morpion
            puts ""
            answer_player1
            display_morpion
            check_if_O
            if i == 4
                puts "Fin de la partie. Il n'y a pas de gagnant.".red
                return play_again
            end
            puts ""
            answer_player2
            display_morpion
            puts ""
            check_if_X
            i += 1
        end
    end
end

game = Game.new
game.play_game