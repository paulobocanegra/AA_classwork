require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
      @board = board  
      @next_mover_mark = next_mover_mark
      @prev_move_pos = prev_move_pos
  end 

  def losing_node?(evaluator) #<--- current player
    if @board.over?
      return false if @board.winner == evaluator || @board.tied?
      return true
    end

    if next_mover_mark == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end




  def winning_node?(evaluator)
    if @board.over?
      return true if @board.winner == evaluator && !@board.tied?
      return false
    end
    
    if next_mover_mark == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    minivan = []
    (0...3).each do |x|
      (0...3).each do |y|
        pos = [x,y] #<---
 
        if @board[pos].nil? 
          new_board = @board.dup
          new_board[pos] = next_mover_mark
          next_mover_mark == :x ?  (new_mark = :o) : (new_mark = :x)
          minivan << TicTacToeNode.new(new_board, new_mark, pos)
        end
      end
    end
          return minivan
    end
    
end


# [x][x][o]
# [][o][x]
# [][][o]

# #1

# [x][x][o]
# [][o][x]
# [][][o]

# #2

# [x][x][o]
# [][o][x]
# [][][o]

# #3

# [x][x][o]
# [][o][x]
# [][][o]