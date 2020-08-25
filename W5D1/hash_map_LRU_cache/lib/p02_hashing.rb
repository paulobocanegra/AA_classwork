class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return self.join("").to_i.hash if self.empty?
    individual_hash_values = []
    self.each_with_index {|ele, i| individual_hash_values << (ele.hash * i.hash)}
    individual_hash_values.sum
  end
end

#  arr = [1,2,3]
# arr.hash  =>   

# class String
#   def hash
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
    
#   end
# end


