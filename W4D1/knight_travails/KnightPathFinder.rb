require_relative "PolyTreeNode.rb"
require "byebug"
class KnightPathFinder

    attr_reader :pos, :considered_positions, :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos) 
        @pos = pos 
        @considered_positions = [pos]
        self.build_move_tree(pos)
    end

    def self.valid_moves(pos)
        #check if pos is any of the 8 possible positions
        possible_moves = []
        moves =  [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
        moves.each do |shifts|
            if (0..7).include?(shifts[0] + pos[0]) && (0..7).include?(shifts[1] + pos[1])
                possible_moves << [shifts[0] + pos[0] , shifts[1] + pos[1]]
            end
        end  
        possible_moves
    end


    def new_move_positions(pos)
        
        pos_options = KnightPathFinder.valid_moves(pos)
        pos_options.reject! { |pos_pos| @considered_positions.include?(pos_pos) }


        @considered_positions += pos_options
        pos_options
    end

    #find all valid moves
    #throw away (reject) all the ones that are in considered position
    #add all moves into considered_pos
    #return all moves that are not in considered

    # temp_queue = new_move_positions(iter_node.value) <-- find new move pos's
            #^ iterate through the temp store to find them chilin's
            # temp_queu.each... <--- get that iterator bru. Get 
    



    def build_move_tree(pos)
        store = [@root_node] # <- every possible space is stored here
        minivan = []

        until store.empty?
            current_node = store.shift #<----
            minivan = new_move_positions(current_node.value)
            minivan.each do |new_pos|
                next_move = PolyTreeNode.new(new_pos) #<----
                current_node.add_child(next_move)
                store << next_move
            end
        end
    end   
    
    


    def find_path(end_pos)
        self.root_node.find_path(end_pos).reverse    
    end
        
end




kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([1,1])

