class Player
    def get_move
    puts "enter a position with coordinates separated with a space like `4 7`"
    #what if the user does not follow the syntax?
    input = gets.chomp
    [input[0].to_i,input[2].to_i]
    end
end
