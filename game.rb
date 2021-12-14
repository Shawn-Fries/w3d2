require_relative './board.rb'
require_relative './card.rb'
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize
        @board = Board.new
        @board.populate
        @human_player = HumanPlayer.new
        @computer_player = ComputerPlayer.new
        @current_player = @human_player
    end

    def play
        previous_guess = []
        until @board.won?
      
            @board.render
            pos = @current_player.prompt
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
                  self.switch_turn!
               end
               previous_guess = []
            else
               @board[previous_guess[0]].reveal
            end
            
          system('clear')
        end
    end

    def switch_turn!
        if @current_player == @human_player
            @current_player = @computer_player
        else
            @current_player = @human_player
        end
    end

end