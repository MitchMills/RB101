###3 CAPITALIZE WORDS
def word_cap(string)
  string.split(' ').map do |word|
    new_word = word.downcase
    new_word[0].upcase!
    p new_word
  end.join(' ')
end

p word_cap('four score and seven') #== 'Four Score And Seven'
# p word_cap('the javaScript language') #== 'The Javascript Language'
# puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
### 2 LETTERCASE COUNTER
# LOWERCASE = ('a'..'z')
# UPPERCASE = ('A'..'Z')

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
#   result = string.each_char.with_object(Hash.new(0)) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   [:lowercase, :uppercase, :neither].each do |category| 
#     result[category] = 0 unless result.has_key?(category)
#   end
#   result
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
#   { lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z') }
# end

# CASES = {
#   lowercase: ('a-z'),
#   uppercase: ('A-Z'),
#   neither: ('^A-Za-z')
# }
# def letter_case_count(string)
#   CASES.each_with_object({}) do |(key, value), result|
#     result[key] = string.count(value)
#   end
# end

# def letter_case_count(string)
#   categories = [:lowercase, :uppercase, :neither]
#   categories.each_with_object({}) do |cat, result|
#     result[cat] = 
#   end
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

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
