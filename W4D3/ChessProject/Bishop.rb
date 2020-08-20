require_relative "Pieces.rb"

class Bishop < Piece
#     def self.valid_moves(pos)
#         #check if pos is any of the 8 possible positions
#         possible_moves = []
#         moves =  [
                    
#                 [
#         moves.each do |shifts|
#             if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
#                 possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
#             end
#         end  

#         possible_moves
#     end
# end


 #check_diagonal (0..7).each do |i| { {@gri}}

#[0,2]       final: [1,1]           change: +1 , -1
#


    #B X X X X X B X
    #X B X X X B X X
    #S X B X B X X X    [2,0]
    #X X X B X X X X    [3,1]                   [3,4]
    #X X B X B X X X    [4,2]                   [4,5]
    #X B X X X B X X    [5,3]
    #B X X X X X B X
    #X X X X X X X B

    # def win_diagonal?(mark)
    #     # take in current_pos ----> first index ---> start from there
    #         checker = []
    #         checker2 = []
    #     (first_index..7).each do |i|
    #     (0..first_index)  
    #         possible_moves << @grid[i][i]
    #         i += 1
    #         checker2 << @grid[i - 1][-i] # [2][-3]
    #     end
    #    left_to_right = checker.uniq.length == 1
    #    right_to_left = checker2.uniq.length == 1
    #     left_to_right || right_to_left
    # end


end


