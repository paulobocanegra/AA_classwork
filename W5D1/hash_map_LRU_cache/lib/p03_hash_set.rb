require "byebug"
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    sub_bucket = key.hash % num_buckets 
   
    # key.join("").to_i.hash if key.empty?

    return false if self.include?(key)
      # debugger
      
    resize! if count == num_buckets
    @store[sub_bucket] << key 
    @count += 1
      
  end

  def include?(key)
    sub_bucket = key.hash % num_buckets 
    @store[sub_bucket].include?(key)
  end

  def remove(key)
    sub_bucket = key.hash % num_buckets 
    if @store[sub_bucket].include?(key)
      @store[sub_bucket].delete(key)
      @count -= 1
    end
  end

  private

  # def [](num)
    
  # end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@count * 2){Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % (count * 2)] << ele
      end
    end
    @store = new_store
  end


end

