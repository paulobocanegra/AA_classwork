require_relative "Pieces.rb"

class Knight < Piece
    def self.valid_moves(pos)
        #check if pos is any of the 8 possible positions
        possible_moves = []
        moves =  [
                [2, 1], 
                [2, -1], 
                [-2, 1], 
                [-2, -1], 
                [1, 2], 
                [-1, 2], 
                [1, -2], 
                [-1, -2]]
        moves.each do |shifts|
            if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
                possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
            end
        end  

        possible_moves
    end
end