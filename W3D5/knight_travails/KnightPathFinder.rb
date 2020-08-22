require_relative "PolyTreeNode.rb"

class KnightPathFinder

    attr_reader :pos 
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos) 
        @pos = pos 
        @considered_postions = [pos]
        # self.build_move_tree = KnightPathFinder.root_node
    end

    def self.valid_moves(pos)
        #check if pos is any of the 8 possible positions
        possible_moves = []
        moves = [
            [-1, -2],
            [-2, -1],
            [ 2 , 1],
            [ 2 , 2],
            [-2,  1],
            [-1 , 2],
            [2 , -1],
            [1 , -2]
          ]
        moves.each do |shifts|
            if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
                possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
            end
        end  
        possible_moves
    end


    def new_move_positions(pos)
        pos_options = KnightPathFinder.valid_moves(pos).reject {|pos_pos| @considered_positions.include?(pos_pos)}
        @considered_pos += pos_options
        pos_options
    end

    #find all valid moves
    #throw away (reject) all the ones that are in considered position
    #add all moves into considered_pos
    #return all moves that are not in considered
    

    def build_move_tree(pos)
        store = [@root_node]

        i = 0
        while i < store.length
        # until store.empty?
        #     next_move = store[i]
        #     store += next_move.new_move_positions(pos) 
        #     next_move.new_move_positions(pos).each do |move|
        #         store << move 
        #     end
        i += 1
        # end
    # end
end

# king1 = KnightPathFinder.new([2,1])

# p KnightPathFinder.valid_moves([7,7])

#Next build nodes representing positions one move away, add these to the queue. Then take the next node from the queue... until the queue is empty.



kpf = KnightPathFinder.new([0, 0])

# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3],]
# kpf.find_path([0, 1]) # => [[0, 0], [2, 1], [3, 3]]

# [
# [0,0], [0,1],[0,0],[0,3],[0,0],[0,0],[0,0],[0,0]
# [1,0], [0,0],[0,0],[0,0],[1,4],[0,0],[0,0],[0,0]
# [0,0], [0,0],[2,2],[0,0],[0,0],[0,0],[0,0],[0,0]
# [3,0], [0,0],[0,0],[0,0],[4,4],[0,0],[0,0],[0,0]
# [0,0], [4,1],[0,0],[4,3],[0,0],[0,0],[0,0],[0,0]
# [0,0], [0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]
# [0,0], [0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]
# [0,0], [0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]
# ]


#origin's children = [[1,2] , [2,1]]    children
#firs_move_options([1,2]) = [0,0],  [0,4], [2,0],  [2,4], [3,1], [3,3]   6 children
#first_move_options([2,1]) = [0,0], [4,0] ,[0,2]  ,[4,2] , [1,3] , [3,3] 6 children


#top-left1 = pos[0] - 1 && pos[1] -2
#top-left2 = pos[0] - 2 && pos[1] - 1

#pos []

#possible = [top_left1, top_left2, ... ]


# (0...@grid.length).each do |row|
#     (0...@grid.length).each do |col|
#         first_move_options1 = @grid[row][col] 
#         first_move_options2 = @grid[col][row] 
#     end
# end

#


#second_move_options()


# if pos[0] == 1 there will be 2 less possible positions
# if pos[0] == 0 there will be 4 less possible positons

