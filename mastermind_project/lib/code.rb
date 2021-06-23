class Code
    POSSIBLE_PEGS = { #Hash Constant
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }
    attr_reader :pegs
    def self.valid_pegs?(arr_char)
        arr_char.each do |char|
            return false if !POSSIBLE_PEGS.include?(char.upcase)
        end
            true
    end

    def initialize (arr_char) #<code.new of an array of char?
        if !Code.valid_pegs?(arr_char)
            raise LoadError 
        else #valid
            @pegs = arr_char.map(&:upcase)
        end
    end

    def self.random(length)
        Code.new(Array.new(length) {POSSIBLE_PEGS.keys.sample})
    end

    def self.from_string(str_pegs)
        Code.new(str_pegs.split(""))
    end

    def [](index)
        @pegs[index]
    end
    def length
        @pegs.length
    end

    def num_exact_matches(guess) #guess is a code instance
        count = 0
        guess.pegs.each.with_index do |char,idx|
            if guess.pegs[idx] == self.pegs[idx]
                count+=1
            end
        end
        count
    end

    def num_near_matches(guess)
        near_match = []
        near_match1 = []
        guess.pegs.each.with_index do |char,idx|
            if guess.pegs[idx] != self.pegs[idx]
                near_match << guess.pegs[idx] 
                near_match1 << self.pegs[idx]
            end
        end
        count = 0
        near_match.each do |ele|
            if near_match1.include?(ele)
                count +=1
                near_match1.delete_at(near_match1.index(ele))
            end
        end
        count
    end

    def ==(guess)
        if guess.pegs.length != self.pegs.length
            return false
        end
        self.pegs== guess.pegs
    end

    



end
