def windowed_max_range(arr, ws)
    cs = 0
    ls = 0
    # continuos_sums = [] #[7, 5, 2, 8, 1]
    #window_size 2
    (0...arr.length).each do |i| 
        cs =  arr[i...i + ws][-1] -  arr[i...i + ws][0]    #cs = 8
        ls = cs if cs > ls    #ls = 8
        cs = 0 if cs < 0
    end
    ls
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

#O(n)