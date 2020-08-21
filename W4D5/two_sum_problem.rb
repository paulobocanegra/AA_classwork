require "byebug"
def bad_two_sum?(arr, target_sum) #n^2
    (0...arr.length-1).each do |i1|
        (i1+1...arr.length).each do |i2|
            return true if arr[i1] + arr[i2] == target_sum        
        end
    end
    false
end
#O(n^2)

def okay_two_sum?(arr, target_sum)
    return false if (arr.empty?) || (arr.length == 2 && arr[0] + arr[1] == target_sum) 
    
    mid_i = arr.length / 2
    left = arr[0...mid_i]
    right = arr[mid_i..-1]
    # debugger
    if arr[mid_i] + arr[mid_i - 1] == target_sum && arr.length > 1
        return true 
    else
        if arr[mid_i] + arr[mid_i - 1] < target_sum
            stack = okay_two_sum?(right, target_sum)
            if  stack
                return okay_two_sum?(right, target_sum)
            else
                return false
            end
        else
            okay_two_sum?(left, target_sum)   
        end
    end
    false
end
# O(n*logn)



def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |ele|   #5
        return true if hash[target_sum - ele]  # hash[2]
        hash[ele] = true    # 5 => true
    end
    false
end

# [6, 5, 1, -1]
# hash= {
#        0 => true
#       1 => true
#       5 =>true 
# }
# arr = [2, 3] #t=5
arr = [0, 1, 5, 7]
# arr = [0, 1, 5, 7, 8, 9] #6  --> t
p two_sum?(arr, 6) #true
p two_sum?(arr, 10) # false
#