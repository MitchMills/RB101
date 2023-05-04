### 6 STAGGERED CAPS II
def staggered_case(string)

end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

### 5 STAGGERED CAPS I
# def staggered_case(str)
#   str.each_char.with_index.map do |char, idx|
#     idx.even? ? char.upcase : char.downcase
#   end.join
# end

# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h

# def staggered_case(string)
#   string.each_char.with_index.map do |char, idx|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     if idx.even?
#       LOWERCASE.include?(char) ? UPPER_TO_LOWER.key(char) : char
#     else
#       UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : char
#     end
#   end.join
# end

# def staggered_case(string, start_upper: true)
#   string.chars.each_with_object('') do |char, result|
#     result << (start_upper ? char.upcase : char.downcase)
#     start_upper = !start_upper
#   end
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
# p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
# p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"

###4 SWAP CASE
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h
# p UPPER_TO_LOWER

# {
#   "A"=>"a", "B"=>"b", "C"=>"c", "D"=>"d", "E"=>"e", "F"=>"f", "G"=>"g", 
#   "H"=>"h", "I"=>"i", "J"=>"j", "K"=>"k", "L"=>"l", "M"=>"m", "N"=>"n", 
#   "O"=>"o", "P"=>"p", "Q"=>"q", "R"=>"r", "S"=>"s", "T"=>"t", "U"=>"u", 
#   "V"=>"v", "W"=>"w", "X"=>"x", "Y"=>"y", "Z"=>"z"
# }

# def swapcase(str)
#   str.chars.map do |char|
#     if char.upcase == char.downcase
#       char
#     elsif char == char.upcase
#       UPPER_TO_LOWER[char]
#     else
#       UPPER_TO_LOWER.key(char)
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     if UPPERCASE.include?(char)
#       UPPER_TO_LOWER[char]
#     elsif LOWERCASE.include?(char)
#       UPPER_TO_LOWER.key(char)
#     else
#       char
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : UPPER_TO_LOWER.key(char)
#   end.join
# end

# def swapcase(str)
#   str.chars.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.each_char.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.split('').map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

###3 CAPITALIZE WORDS
# def word_cap(words)
#   words.split.map(&:capitalize).join(" ")
# end

# def word_cap(words)
#   words.downcase.split.map do |word|
#     word[0] = word[0].upcase
#     word
#   end.join(' ')
# end

# def word_cap(words)
#   words.split.map { |word| word[0].upcase + word[1..].downcase }.join(' ')
# end

# def word_cap(words)
#   words.split.map do |word|
#     word.each_char.with_index.map do |char, idx|
#       idx == 0 ? char.upcase : char.downcase
#     end.join
#   end.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

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
