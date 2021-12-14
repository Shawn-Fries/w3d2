
class ComputerPlayer

   def initialize
      @known_cards = Hash.new {|h,k| h[k]= []}
      @matched_cards = []
   end

    def prompt
        

    end


    def receive_revealed_card(pos, value)
      @known_cards[value] << pos if !known_cards[value].include?(pos)
    end


    def receive_match(value) 
      @matched_cards << value
    end



end