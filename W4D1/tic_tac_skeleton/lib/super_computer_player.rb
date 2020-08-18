require_relative 'tic_tac_toe_node'
require_relative 'tic_tac_toe'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark) 
    current_board = game.board
    root_node = TicTacToeNode.new(current_board, mark)
    chevy_astro = root_node.children
    
    chevy_astro.select! do |kiddo|
       return kiddo.prev_move_pos if kiddo.winning_node?(mark)
       !kiddo.losing_node?(mark)
    end

    raise 'these kids suck' if chevy_astro.empty?
    chevy_astro.shuffle.pop.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
