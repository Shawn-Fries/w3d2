require_relative './card.rb'
require_relative './game.rb'

class Board
    def initialize
        @grid = Array.new(4) {Array.new(4, Card.new)}
    end

    def num_pairs
        (@grid.length ** 2) / 2    #4x4 = 16 spots / 2 =  8 unique pairs
    end

    def card_values
        (0...self.num_pairs).map do |i|    #8 elements
            (i+97).chr.upcase
        end                                
    end

    def populate
        

    end
end