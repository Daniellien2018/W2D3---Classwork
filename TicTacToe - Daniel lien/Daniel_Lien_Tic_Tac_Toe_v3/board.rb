class Board #responsible for adding a players marks, checking winners, and printing game board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end
    def [](position)
        row, col = position
        @grid[row][col]
    end
    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end
        
    def valid?(position)#return a boolean indicating weather or not the position is out of bounds
        row, col = position
        position.all? do |i| #will pass all pos[] and check
            0 <= i && i < @grid.length
        end
    end

    def empty?(position)
        if self[position] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "This is not a valid mark"
        end
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end
    def win_row?(mark)
        @grid.any do |row|
            if row.all?(mark) == true
                return true
            end
        end
        return false
    end
    def win_col?(mark)
        transposed = @grid.transpose
        transposed.any do |col|
            if col.all?(mark) == true
                return true
            end
        end
        return false
    end
    
    def win_diagonal?
        down_right = (0...@grid.length).all? do |i|
            position = [i,i]
            self[position] == mark
        end
        down_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 -i   
            position = [row,col]
            self[position] == mark
        end
        if down_right || down_left
            return true
        end
        return false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? do |pos|
            empty?(pos)
        end
    end
    def legal_positions
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.select { |pos| empty?(pos) }
    end
end
