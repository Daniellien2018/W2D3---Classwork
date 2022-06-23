require_relative "board"
require_relative "player"

class Battleship
    def initialize(n) #number representing length of board
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2 
    end
    def board 
        @board
    end
    def player
        @player
    end
    def start_game
        @board.place_random_ships
        p @board.num_ships
        p @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end
    def win?
        if @board.num_ships == 0 
            p "you win"
            return true
        else
            return false
        end
    end
    def game_over? #is this game over? check win not win yet
        if win? == true
            return true
        elsif lose? == true
            return true
        else
            return false
        end
    end
    def turn
        move = @player.get_move
        hit = @board.attack(move)
        if hit == false #if not success
            p @remaining_misses -= 1
            @board.print
        else   
            p @remaining_misses
            @board.print
        end
    end
end
