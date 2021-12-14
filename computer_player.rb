
class ComputerPlayer

   def initialize
      @known_cards = Hash.new {|h,k| h[k] = []}
      @matched_cards = []
   end

    def prompt(is_even_turn)
        pairs_with_two_moves_selected = @known_cards.select {|k, v| v.length == 2}.keys
        possible_pairs = pairs_with_two_moves_selected - @matched_cards
        if possible_pairs.length > 0
            positions = @known_cards[possible_pairs.first]
            if positions.first
    end


    def receive_revealed_card(pos, value)
      @known_cards[value] << pos if !known_cards[value].include?(pos)
    end


    def receive_match(value) 
      @matched_cards << value
    end



end