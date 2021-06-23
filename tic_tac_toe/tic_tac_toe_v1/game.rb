require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            
            input = @current_player.get_position #if its the first error it breaks the game
            while !(@board.valid?(input) &&  @board.empty?(input))
                puts "Re-input"
                input = @current_player.get_position
            end
            @board.place_mark(input,@current_player.mark)
            if @board.win?(@current_player.mark)
                
                return "#{@current_player.mark} has won the game!!!"
            end
            self.switch_turn
        end
        puts "The game is a draw"
    end
end