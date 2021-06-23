class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{@mark.to_s} enter position as row and column as 2 numbers with a space in between  '1 1'"
        input = gets.chomp
        input_arr = input.split(" ")
        if input.split("").count(" ") != 1
            raise "Too many/little spaces"
        end
        #i guess i can assign row and column variables and set them equal to Integer(input_arr[0]) and Integer(input_arr[2])
        row = input_arr[0]
        column = input_arr[1]
        if (Integer(row).is_a? Integer) && (Integer(column).is_a? Integer) #valid format cause we checked if its atleast length 3, has 1 space, and now the 1st and 3rd char are numeric
            return [Integer(row),Integer(column)]
        else
            raise "Two numbers were not entered"
        end
    end
end