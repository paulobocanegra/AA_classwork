
module Slideable
    def horizontal_vertical_dirs
        [-1,-1]
        [-1, 1]
        [1, -1]
        [1, 1]
    end
    
    def diagonal_dirs(pos)  
         
                      
        possible = [[0, 1], [0, -1], [1, 0], [-1, 0]]
        final_moves = []

        possible.each do |moves|    #[0,1]
            row = pos[0]            #0
            col = pos[1]            #1
            up_or_down = moves[0] 
            left_or_right = moves[1]    
            
            if up_or_down == 0
                while col >= 0 && col <= 7 
                    if [row, col] == !NullPiece && [row,col].color != [pos].color
                        final_moves << [row, col] 
                        col += left_or_right 
                        #end
                        break
                end
            elsif left_or_right == 0   
                while row >= 0 && row <= 7 
                    final_moves << [row, col]
                    row += left_or_right    
                end
            end
        end

        final_moves
    end
    end

    def moves

    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end

end


    #R X B X X X K X
    #X X X X X X X X
    #X X K X X X X X
    #X X X X X X X K
    #X X X K X X X X
    #X X X X X X X X
    #X X X X X X B X
    #X X X X X X X X