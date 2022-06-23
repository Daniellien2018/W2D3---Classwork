class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end
    def mark
        @mark
    end

    def get_position
        p "Input mark as number + space + number"
        input = gets.chomp #input is [row,col]
        position = input.split(" ") #[1,2]
        position.map {|ele| ele.to_i}
        if position.length != 2
            raise "invalid input"
        end
        return position.map {|ele| ele.to_i}
    end
end