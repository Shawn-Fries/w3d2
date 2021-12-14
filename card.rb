require_relative './board.rb'
require_relative './game.rb'
require_relative "./human_player.rb"

class Card
    attr_accessor :value, :face_down
    def initialize
        @value = " "
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