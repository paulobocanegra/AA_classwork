def my_min_nested(arr)      #[4,3,2,1] # O(n^2)
    min = 0
    arr.each_with_index do |ele1, i1|       
        arr.each_with_index do |ele2, i2|   
            if i2 > i1 && ele1 < ele2 
                min = ele1 
            elsif i2 > i1 && ele1 > ele2 
                min = ele2 
            end
        end
    end
    min
end


def my_min_injected(arr) # O(n)
    arr.inject do |accum, ele|
        if accum > ele 
            accum = ele  
        else
            accum 
        end
    end
end


def largest_sub_sum(arr)
    sum = []
        arr.each_with_index do |ele1, i1|       
            sum << ele1 
            arr.each_with_index do |ele2, i2|   
                if i2 > i1 
                    sum << arr[i1..i2].sum
                end
            end
        end
    sum.max
end

#list = [2, 3, -6, 7, -6, 7]

def largest_sub_sum_better(arr)
   cs = 0 #5
    ls = 0
    continuos_sums = [] #[7, 5, 2, 8, 1]
    (0...arr.length).each do |i|
        # if arr[i] > 0
             cs +=  arr[i]     #cs = 8
        # else
            ls = cs if cs > ls    #ls = 8
            cs = 0 if cs < 0
        # end
        # ls = cs if ls < cs

    end
    
    ls
end

#O(n^2)
arr  = [2, 3, -6, 7, -6, 7]
p largest_sub_sum_better(arr)



