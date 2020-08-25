class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    # self.next = nil
    # self.prev = nil
    # self.val = nil
    # self.key = nil
  end
end

class LinkedList
include Enumerable

  def initialize
    @head = Node.new("head")
    @tail = Node.new("tail")
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    each { |node| return node.val if node.key == key }
  end

  def include?(key)
    each { |node| return true if key == node.key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev  
    @tail.prev = new_node
    new_node.next = @tail
    new_node.prev.next = new_node
    return true
  end

  def update(key, value)
    each { |node| node.val = value if node.key == key}
  end

  def remove(key)
    each { |node| node.remove if node.key == key}
  end

  def each

    if block_given?
      node = @head.next
      until node == @tail
        yield(node)
        node = node.next
        # break if node.nil?
      end
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
