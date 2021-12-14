require_relative './card.rb'
require_relative './game.rb'

class Board
    def initialize
        @grid = Array.new(4) {Array.new(4, Card.new)}
    end

    def populate

    end
end