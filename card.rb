require_relative './board.rb'
require_relative './game.rb'

class Card
    def initialize
        @value = nil
        @face_down = true
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    def to_s
        @value.to_s
    end

    def ==(card)
        @value == card.value
    end


end