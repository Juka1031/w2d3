require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(n, hash_players) #keys are marks values are boolean false is human
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @players = []
        hash_players.each do |mark,computer|
            if computer == false
                @players << HumanPlayer.new(mark)
            else
                @players << ComputerPlayer.new(mark)
            end
        end
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            
            # input = @current_player.get_position #if its the first error it breaks the game
            # while !(@board.valid?(input) &&  @board.empty?(input))
            #     puts "Re-input"
            #     input = @current_player.get_position
            # end
            legal = @board.legal_positions
            input = @current_player.get_position(legal)
            @board.place_mark(input,@current_player.mark)
            if @board.win?(@current_player.mark)
                
                return "#{@current_player.mark} has won the game!!!"
            end
            self.switch_turn
        end
        puts "The game is a draw"
    end
end