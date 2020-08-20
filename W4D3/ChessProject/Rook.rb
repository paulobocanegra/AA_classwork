require_relative "Pieces.rb"
require_relative "Board.rb"

class Rook < Piece
    
end

#[0,0]
# 

rook1 = Rook.new([0,0])
p rool1.valid_moves([0,0])