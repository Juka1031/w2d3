class ComputerPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal)
        random = legal.sample
        puts "Computer #{mark.to_s} has chosen #{random.to_s}"
        random
    end
end
