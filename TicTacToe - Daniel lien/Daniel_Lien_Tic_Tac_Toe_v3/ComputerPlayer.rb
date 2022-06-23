

class Computer_player
    def initialize(mark_value)
        @mark = mark_value
    end
    def mark
        @mark
    end

    def get_position(legal_positions) #assume given an array
        picked = legal_positions.sample
        puts "Computer #{self.mark} chose position #{picked.to_s}"
        return picked
    end
end