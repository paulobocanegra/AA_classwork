class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil   
        @children = []
    end

    def parent
        @parent 
    end

    def children
        @children 
    end

    def value 
        @value 
    end

    def parent=(new_parent)
        if @parent
        self.parent.children.delete(self)
        # self.parent.children.each_with_idex do |child|
        #    self.parent.children.delete(child)
        # end
        end
        
        @parent = new_parent
        if @parent 
         @parent.children << self
        end
    end

    # def add_child
    #      << self.parent.children
    # end
end

# Write a #parent= method which (1) sets the parent property and (2) adds the node to their parent's array of children (unless we're setting parent to nil).

# poly1 = PolyTreeNode.new(4)