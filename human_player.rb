class HumanPlayer
    def prompt(is_even_turn)
        p 'Please input a position to check, separated by a space'
        pos = gets.chomp.split(' ').map {|ele| ele.to_i}
    end
end