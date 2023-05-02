### 2 LETTERCASE COUNTER
LOWERCASE = ('a'..'z')
UPPERCASE = ('A'..'Z')

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char do |char|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   result
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if char.downcase == char.upcase
#       result[:neither] += 1
#     elsif char.downcase == char
#       result[:lowercase] += 1
#     elsif char.upcase == char
#       result[:uppercase] += 1
#     end
#   end
# end

# def letter_case_count(string)
#   result = Hash.new(0)
#   result[:lowercase]  = string.count('a-z')
#   result[:uppercase]  = string.count('A-Z')
#   result[:neither]    = string.count('^A-Za-z')
#   result
# end

# def letter_case_count(string)
#   {
#   lowercase: string.count('a-z'),
#   uppercase: string.count('A-Z'),
#   neither: string.count('^A-Za-z')
#   }
# end

def letter_case_count(string)
  case = {
    lowercase: ('a'..'z')
    uppercase: ('A'..'Z')
    neither: ()
  }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

### 1 COMBINE TWO LISTS
# def interleave(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << arr1[idx] << arr2[idx]
#   end
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
