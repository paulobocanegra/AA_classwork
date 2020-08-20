require_relative "Pieces.rb"

class Pawn < Piece
    # def at_start_row?(pos)
    #     pos[0] == 1 || pos[0] == 6
    # end
    
    #  def forwrad_dir(pos)
    #     #check if pos is any of the 8 possible positions
    #     possible_moves = []
    #     moves =  [
    #             [1, 0],
    #             [-1, 0]
    #             ]
    #     moves.each do |shifts|
    #         if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
    #             possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
    #         end
    #     end  
    #     possible_moves
    # end


    # def first_pawn_move
    #     possible_moves = []
    #     moves =  [
    #             [1, 0],
    #             [2, 0],
    #             [-1, 0],
    #             [-2,0]
    #             ]
    #     moves.each do |shifts|
    #         if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
    #             possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
    #         end
    #     end  
    #     possible_moves
    # end

    # def side_attacks
    #     possible_attacks = []
    #     moves =  [
    #             [1, 1],
    #             [1, -1],
    #             [-1, -1],
    #             [-1, 1]
    #             ]
    #     moves.each do |shifts|
    #         if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
    #             possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
    #         end
    #     end  
    #     possible_moves
    # end

    # def forward_steps

    # end



end


    #X X X X X X K X    
    #X P X X X X X X    [1,1]
    #X P K X X X X X    [2,1] -----> [1, 0]
    #X P X X X X X K    [3,1]        [-1, 0]
    #X X X K X X X X                 attack = [1, 1], [1, -1], 
    #X X X X X X X X
    #X X X X X X X X
    #X X X X X X X X