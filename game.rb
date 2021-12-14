require_relative './board.rb'
require_relative './card.rb'

class Game
    def initialize
        @board = Board.new
        @board.populate
    end

    def play
        previous_guess = []
        until @board.won?
      
            @board.render
            p 'Please input a position to check, separated by a space'
            pos = gets.chomp.split(' ').map {|ele| ele.to_i}
            previous_guess << pos
            if previous_guess.length > 1
                if @board[previous_guess[0]] == @board[previous_guess[1]]
                    @board[previous_guess[1]].reveal
                     puts "Match Found!"
                     sleep(1)             
                else
                  @board[previous_guess[1]].reveal
                  @board.render
                  sleep(1)           
                  @board[previous_guess[1]].hide
                  @board[previous_guess[0]].hide
               end
               previous_guess = []
            else
               @board[previous_guess[0]].reveal
            end
         #  sleep(1)
          system('clear')
        end
    end


end