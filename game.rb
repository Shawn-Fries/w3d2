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
            value = @board[previous_guess.last].value
            latest_guess = previous_guess.last 

            @computer_player.receive_revealed_card(latest_guess, value )
            if previous_guess.length > 1
                if @board[previous_guess[0]] == @board[latest_guess]
                    @board[latest_guess].reveal
                     puts "Match Found!"
                     @computer_player.receive_match(@board[latest_guess].value)
                     sleep(1)             
                else
                  @board[latest_guess].reveal
                  @board.render
                  sleep(1)           
                  @board[latest_guess].hide
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