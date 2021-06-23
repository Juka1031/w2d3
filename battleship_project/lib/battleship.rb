require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize (n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n**2/2
    end

    def start_game
        @board.place_random_ships()
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            false
        end
    end
    
    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn 
        attack = @player.get_move
        result = @board.attack(attack)
        @board.print
        if result == false
            @remaining_misses -= 1
        end
        p @remaining_misses
    end

end
