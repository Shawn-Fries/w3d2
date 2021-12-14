require_relative './card.rb'
require_relative './game.rb'

class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(4) {Array.new(4) {Card.new}}

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
        possible_letters = card_values * 2
        @grid.each do |outer|
            outer.each do |inner|
                letter = possible_letters.sample
                index = possible_letters.index(letter)
                inner.value = letter
                possible_letters.delete_at(index)
            end
        end
    end

    def render
        @grid.each do |outer|
            outer.each do |inner|
                if !inner.face_down 
                    print "#{inner.value} " 
                else
                    print " "
                end
            end
            puts ""
        end 
        # @grid.map do |outter|
        #     outter.map do |inner|
        #         inner.value.join(" ") if !inner.face_down
        #     end
        # end 
    end

    def won?
        @grid.all? {|row| row.all? {|card| !card.face_down}}
    end

    def reveal(pos)  #[1,1]
        @grid[pos.first][pos.last].reveal
        @grid[pos.first][pos.last].value
    end

    def [](pos)
        @grid[pos.first][pos.last]
    end
end