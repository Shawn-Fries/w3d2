require_relative './board.rb'
require_relative './card.rb'

class Game
    def initialize
        @board = Board.new
    end

    def play
        previous_guess = []
        until @board.won?
            system('clear')
            sleep(1)
            @board.render
            p 'Please input a position to check, separated by a space'
            pos = gets.chomp.split(' ').map {|ele| ele.to_i}
            previous_guess << pos
            if previous_guess.length > 1
               # if @board.grid[previous_guess[-2].first][previous_guess[-2].last] == @board.grid[previous_guess[-1].first][previous_guess[-1].last]
                if @board.grid[previous_guess[-2]] == @board.grid[previous_guess[-1]]
                    @board.grid[previous_guess[-2]].reveal
                    @board.grid[previous_guess[-1]].reveal
                end
                previous_guess = []
            end
        end
    end


end