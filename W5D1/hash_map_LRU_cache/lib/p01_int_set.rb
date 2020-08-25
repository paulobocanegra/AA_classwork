require "byebug"


class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  #[false,false,false.. ]
  def insert(num) #1
     validate!(num)
     @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num > @max - 1 || num < 1
    true
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet

    attr_reader :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    sub_bucket = num % num_buckets #1
    @store[sub_bucket].push(num)
  end
   

  def remove(num)
    if self.include?(num)
      sub_bucket = num % num_buckets #1
      @store[sub_bucket].delete(num)
    end
  end

  def include?(num)
    sub_bucket = num % num_buckets #1
    @store[sub_bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    sub_bucket = num % num_buckets 

    if !self.include?(num) 
      @store[sub_bucket] << num
      @count += 1
    end
    resize! if @store.flatten.count  > num_buckets
  end

# [  []  [4]   []]

  def remove(num)
    sub_bucket = num % num_buckets 
    if self.include?(num)
      @store[sub_bucket].delete(num)
      @count -= 1 
    end
  end

  def include?(num)
    @store.flatten.include?(num)   end

  # def sub_bucket(num)
  #   num % num_buckets
  # end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    if @store.any? {|bucket| bucket.length > 1}
      temp = @store.dup
      @count = 0

      @store = Array.new(num_buckets * 2) { Array.new }
      temp.each do |subarr|
        subarr.each do |num|
          self.insert(num)
        end
      end
    end
  end


end

#  1) ResizingIntSet#resize! should resize when enough items are inserted
#      Failure/Error: expect(set).to receive(:resize!).exactly(1).times
# (#<ResizingIntSet:0x00007fc1b89744e8>).resize!(*(any args))
#            expected: 1 time with any arguments
#            received: 0 times with any arguments