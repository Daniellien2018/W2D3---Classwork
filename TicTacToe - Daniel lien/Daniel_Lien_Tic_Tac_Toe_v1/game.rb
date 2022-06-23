require './board.rb' 
require './human_player.rb'

class Game
    def initialize(mark_1, mark_2)
        @player1 = HumanPlayer(mark_1)
        @player2 = HumanPlayer(mark_2)
        @currentplayer = @player1
        @board = Board.new
    end
    # def player1
    #     @player1
    # end
    # def player2
    #     @player2
    # end
    def switch_turn
        if @currentplayer = player1
            @currentplayer = player2
        else
            @currentplayer = player1
        end
    end
    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Game Over"
                puts @current_player.mark.to_s + "is the Winner"
                return
            else
                switch_turn
            end
        end
        puts "Game Over"
        puts "Draw"
    end
end