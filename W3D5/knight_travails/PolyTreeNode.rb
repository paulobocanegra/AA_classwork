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



    def add_child(child)
        # if !self.children.include?(child)
        #     child.parent.children << child
        # end
       
        child.parent = self
        #"should pass itself to the child's #parent="
    end

    def remove_child(child) 
        raise "node does not have that child" if !self.children.include?(child)
        child.parent = nil
    end

    def dfs(val) #val = "e"
        return self if self.value == val #d.value = "D"
      
         self.children.each do |child|  #b     ["b" , "c"]
                                            #["d", "e"]
            # p child
            recursive_s = child.dfs(val)
            if recursive_s
                return recursive_s
            end
         end
         nil
    end

    def bfs(val)
        store = [self]

        # store + self.children 
        until store.empty?
            current_child = store.shift
            return current_child if current_child.value == val 
            current_child.children.each do |child|
                store << child 
            end
        end
        nil 
    end
end






