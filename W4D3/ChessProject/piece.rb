require "singleton"
require_relative "Pieces.rb"

class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def moves
        valid_moves_before_functionability = self.valid_moves(pos)
        valid_moves_after_functionability = functionability(valid_moves_before_functionability) #can this slide or does it step
        
        # functionability method ---> take the valid positions and then its going to check every position on the board that it would 
        #have to go through to get there ----> select moves that can do that.
    end


end 


class NullPiece < Piece
    def initialize
        @color = :none
        @symbol = :X
    end
    include Singleton
end













 