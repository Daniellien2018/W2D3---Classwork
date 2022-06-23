class Player
    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        move = gets.chomp #move = "4 7"
        nums = move.split(" ") #["4", "7"]
        nums.map{ |ele| ele.to_i} #or (&:to_i)
    end
end
