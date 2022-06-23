require './board.rb' 
require './human_player.rb'
require './computer_player.rb'

class Game
    def initialize(num, players)
        @players = players.map do |mark, computer|
            computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        
        @currentplayer = @players.first
        @board = Board.new(num)
    end
    # def player1
    #     @player1
    # end
    # def player2
    #     @player2
    # end
    def switch_turn #players is an array, rotate 
        rotate = @players.rotate
        @current_player = rotate[0]
        
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