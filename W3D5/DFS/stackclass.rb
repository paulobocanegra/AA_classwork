class Stack

        attr_reader :store
    def initialize
      # create ivar to store stack here!
      @store = []
    end

    def push(el)
      # adds an element to the stack
      store << el
        self
    end

    def pop
      # removes one element from the stack
      store.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      store.last
    end
    
    def val 
        store.val 
    end

end



    
# stack1 = Stack.new("A")
# "B" = Stack.new("B")
# "C" = Stack.new("C")
# "D" = Stack.new("D")
# "E" = Stack.new("E")
# "F" = Stack.new("F")
# "G" = Stack.new("G")

# p dfs("A", "E") #"E"




# "A".push("B")
                        #         "A"
                        #     "B"     "C"
                        # "D"  "E"  "F"  "G"

  