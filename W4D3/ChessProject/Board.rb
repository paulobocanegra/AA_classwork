require_relative "Pieces.rb"
require_relative "piece.rb"



class Board

    def initialize
        @grid = Array.new(8) { Array.new(8, NullPiece.instance)}
        # @sentinel = NullPiece.instance
        pieces_white = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        pieces_black = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
        
        pieces_white.each_with_index do |piece, i|
            @grid[0][i] = piece.new('white', self, [0, i])
        end
        pieces_black.each_with_index do |piece, i|
            @grid[7][i] = piece.new('black', self, [7, i])
        end
        
        (0..7).each {|i| @grid[1].map! {|pos| pos = Pawn.new('white', self, [1, i])} }
        (0..7).each {|i| @grid[6].map! {|pos| pos = Pawn.new('black', self, [6, i])} }

    end
  
    
    def [](pos)
        row, col = pos[0], pos[1]
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos[0], pos[1]
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]

        if self[end_pos] == NullPiece.instance && piece.class.valid_moves(start_pos).include?(end_pos)
            self[end_pos] = piece
            self[start_pos] = NullPiece.instance
        end    
    end

    def valid_position?(pos)
        return false if !(0..7).include?(pos[0]) || !(0..7).include?(pos[1])
        true
    end

    def print_grid
        @grid.each do |row|
            puts row
            p '----------'
        end
    end

end

new_board = Board.new
new_board.print_grid
# new_board.move_piece([0, 1], [2, 2])
new_board.moves([0, 0])

# puts
# p '=========================this is a new board ==================================='
# puts
# new_board.print_grid

    #R X X X X X K X
    #X X X X X X X X
    #X X K X X X X X
    #X X X X X X X K
    #X X X K X X X X
    #X X X X X X X X
    #X X X X X X X X
    #X X X X X X X X