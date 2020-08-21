
def slow_anagram(word, word2)
    chars = word.split("")
    perms = chars.permutation.to_a
    perms.include?(word2)
end

def second_anagram?(word, word2)
    str1 = word.split("")
    # str2 = word2.split("")
    (0...str1.length).each do |i|
        if word2.find_index(str1[i])
            word2[i] = ""
        end
    end
    word2.empty?
end
#O(n) 
#word1= "hel"
#word2= "loworld"


def third_anagram?(word1, word2)
    arr1 = word1.split("")
    arr2 = word2.split("")
    sorted1 = arr1.sort 
    sorted2 = arr2.sort
    sorted1 == sorted2
end
#O(n+m) = O(n+m)

def fourth_anagram?(word1, word2)
    h1 = Hash.new(0) 
    h2 = Hash.new(0) 

    word1.each_char {|char| h1[char] += 1}
    word2.each_char {|char| h2[char] += 1}

    h1 ==  h2
end
#O(n+m) 

def bonus_fourth_anagram?(word1, word2)
    h1 = Hash.new(0)

    # (0...word1.length).each do |i|
    #     if word2.find_index(word1[i])
    #         h1[word1[i]] += 1
    #         word2[i] = "" 
    #     end
    # end
    # word2.empty?    

    word1.each_char {|char| h1[char] += 1}
    word2.each_char {|char| h1[char] -= 1}

    h1.values.all? {|v| v == 0}
end

p bonus_fourth_anagram?("hello", "olleh")
p bonus_fourth_anagram?("hello", "ollehoas")