class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end
    def mark
        @mark
    end

    def get_position(legal_positions)
        position = nil

        until legal_positions.include?(position) 
            p "Input mark as number + space + number"
            input = gets.chomp #input is [row,col]
            position = input.split(" ") #[1,2]
            real_pos = position.map {|ele| ele.to_i}

            if !legal_positions.include?(real_pos)
                puts "#{real_pos} is not a legal position"
            end
            if position.length != 2
                raise "invalid input"
            end
        return real_pos
        end
    end
end