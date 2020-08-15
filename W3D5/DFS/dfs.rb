require_relative "./stackclass.rb"

class Node 

    attr_reader :value, :children

    def initialize(value, children)
        @value = value
        @children = children
    end

    def dfs(val)   # val="E"
        # stack = Stack.new 
         return self.value if self.value == val #d.value = "D"
      
         self.children.each do |child|  #b 
            # p child
            recursive_s = child.dfs(val)
              child.dfs(val)
            if recursive_s
                return recursive_s
            end
         end
         nil
        #iterate the note's children
        #return value if found
        #return nil if val is not found
    end

    #  def bfs(val)
    #     queue = MyQueue.new
    #     queue.enqueue(self)
    #     until queue.empty?
    #         current_node = queue.dequeue
    #         return current_node if current_node.value == val 
    #         current_node.children.each do |child|
    #             queue.enqueue(child)
    #         end
    #     end
    #     nil 
    # end

end



a = Node.new("A", [])
b = Node.new("B", [])
c = Node.new("C", [])
d = Node.new("D", [])
e = Node.new("E", [])
f = Node.new("F", [])
g = Node.new("G", [])
a.children.push(b)
a.children.push(c)
b.children.push(d)
b.children.push(e)
c.children.push(f)
c.children.push(g)
p a.dfs("F")

#<Node:0x00007fd39505e798 @value="A", @children=[#<Node:0x00007fd39505e720 @value="B", @children=[#<Node:0x00007fd39505e608 @value="D", @children=[]>, #<Node:0x00007fd39505e590 @value="E", @children=[]>]>, #<Node:0x00007fd39505e6a8 @value="C", @children=[#<Node:0x00007fd39505e518 @value="F", @children=[]>, #<Node:0x00007fd39505e428 @value="G", @children=[]>]>]>

# "A".show =>  <234862384823723 value="A", children=[<7826832847982472 value="B" children=[]]
