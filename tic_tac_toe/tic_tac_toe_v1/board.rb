class Board
    def initialize #position is indiciated by an array [a,b] where a is the row (array) and b is the column (element of subarray)
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        if (position[0] > @board.length-1 || position[0] < 0) || (position[1] > @board.length-1 || position[0] < 0)
            return false
        end
        true
    end

    def empty?(position)
        if @board[position[0]][position[1]] == '_'
            return true
        end
        false
    end

    def place_mark(position,mark)
        if !valid?(position) #if position is not valid or the given position is out of bounds
            raise  "Position not valid"
        end
        if !empty?(position) #if position is not '_'
            raise  "Position is not empty"
        end
        @board[position[0]][position[1]] = mark
    end

    def print#should i call on self?
        @board.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @board.each do |row|
            if row.count(mark) == @board.length
                
                return true
            end
        end
        false
    end

    def win_column?(mark)
        @board.transpose.each do |column|
            if column.count(mark) == @board.length
                
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        count= 0
        @board.each_with_index do |subarray, row|
            subarray.each_with_index do |ele, column|
                if row == column && ele == mark
                    count += 1
                end
            end
        end
        if count == @board.length #if the mark appears 3 time going from top left to bottom right, it means 3 in a row
            
            return true
        end

        #now do for the other diagonal
        count1= 0
        @board.each_with_index do |subarray,idx|
            if @board[idx][(subarray.length-1)-idx] == mark
                count1 +=1
            end
        end
        if count1 == @board.length 
            
            return true
        end
        false
    end

    def win?(mark)
        if win_diagonal?(mark) || win_row?(mark) || win_column?(mark)
            return true
        end
        false
    end

    def empty_positions?
        if @board.flatten.include?('_')
            return true
        end
        false
    end
end
