class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n**2
    end

    def [](position) #position is an array [row,column]
        @grid[position[0]][position[1]]
    end

    def []=(position,value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |subarray|
            subarray.each do |ele|
                if ele == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(position)
        if self.[](position) == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] =:X
            return false
        end
    end

    def place_random_ships #i could also print out x unique elements of an array and fill those numbers into a grid with some algo
        limit =( @size *0.25).ceil
        ship_count = 0
        
        while ship_count!= limit
            
            @grid[rand(0..@grid.length-1)][rand(0..@grid.length-1)] = :S
            ship_count = @grid.flatten.count(:S)
        end
    end

    def hidden_ships_grid
        hidden = @grid.map do |subarray|
            subarray.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(two_d_array)
        two_d_array.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid())
    end


    
  
end
