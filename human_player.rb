class HumanPlayer
    def prompt
        p 'Please input a position to check, separated by a space'
        pos = gets.chomp.split(' ').map {|ele| ele.to_i}
    end
end