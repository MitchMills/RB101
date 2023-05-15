### 7 DOUBLE CHAR II
def double_consonants(string)

end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

### 6 DOUBLE CHAR I
# def repeater(string)
#   string.chars.map { |char| char * 2 }.join
# end

# def repeater(string)
#   string.chars.zip(string.chars).join
# end

# def repeater(string)
#   string.each_char.with_object("") { |char, output| output << char * 2 }
# end

# def repeater(string)
#   string.chars.inject("") {|new_string, char| new_string << char * 2 }
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

### 5 FIZZBUZZ
# def fizzbuzz(start_num, end_num)
#   (start_num..end_num).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#       puts "FizzBuzz"
#     elsif num % 3 == 0
#       puts "Fizz"
#     elsif num % 5 == 0
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# def fizzbuzz(start, stop)
#   (start..stop).each do |num|
#     if 15.step(stop, 15).include?(num)
#       puts "FizzBuzz"
#     elsif 3.step(stop, 3).include?(num)
#       puts "Fizz"
#     elsif 5.step(stop, 5).include?(num) 
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# def fizzbuzz(start, stop)
#   puts (start..stop).map { |num| fizzbuzz_value(num) }.join(", ")
# end

# def fizzbuzz_value(num)
#   case
#   when num % 15 == 0 then "FizzBuzz"
#   when num % 3 == 0 then "Fizz"
#   when num % 5 == 0 then "Buzz"
#   else num
#   end
# end

# def fizzbuzz(start, stop)
#   result = (start..stop).each_with_object("") do |num, string|
#     string << num.to_s unless num % 3 == 0 || num % 5 == 0
#     string << "Fizz" if num % 3 == 0
#     string << "Buzz" if num % 5 == 0
#     string << ", " unless num == stop
#   end
#   puts result
# end

# def fizzbuzz(start, stop)
#   result = (start..stop).map do |num|
#     word = [["Fizz"][num % 3], ["Buzz"][num % 5]].compact
#     word.empty? ? num : word.join
#   end
#   puts result.join(", ")
# end

# def fizzbuzz(start, stop) # Daniel Chae's recursive solution
#   print(
#     ( (ele = "FizzBuzz"[(start % 3 == 0 ? 0 : 4)...(start % 5 == 0 ? 8 : 4)]).empty? ) ? start : ele, (start < stop ? ", " : "\n")
#   ); fizzbuzz(start+1, stop) if start < stop
# end

# def fizzbuzz(start_num, end_num) # my non-recursive solution based off his idea
#   result = (start_num..end_num).map do |num|
#     start = num % 3 == 0 ? 0 : 4
#     stop = num % 5 == 0 ? 8 : 4
#     word = "FizzBuzz"[start...stop]
#     word.empty? ? num : word
#   end
#   puts result.join(", ")
# end

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

### 4 PALINDROMIC SUBSTRINGS
############## most readable
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def find_substring_palindromes(string)
#   string.chars.each_index.with_object([]) do |stop_idx, palindromes|
#     substring = string[0..stop_idx] 
#     palindromes << substring if is_palindrome?(substring)
#   end
# end

# def palindromes(string)
#   # string = string.downcase.gsub(/[^a-z0-9]/, '')
#   string.chars.each_index.map do |start_idx|
#     find_substring_palindromes(string[start_idx..-1])
#   end.flatten
# end

#####################
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def find_substring_palindromes(string)
#   string.chars.each_index.map do |stop_idx|
#     string[0..stop_idx]
#   end.select { |substring| is_palindrome?(substring) }
# end

# def palindromes(string)
#   string.chars.each_index.map do |start_idx|
#     find_substring_palindromes(string[start_idx..-1])
#   end.flatten
# end

################ most readable
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def get_leading_substrings(string)
#   string.chars.each_index.map do |stop_idx| 
#     string[0..stop_idx]
#   end
# end

# def get_all_substrings(string)
#   string.chars.each_index.map do |start_idx|
#     get_leading_substrings(string[start_idx..-1])
#   end.flatten
# end

# def palindromes(string)
#   # string = string.downcase.gsub(/[^a-z0-9]/, '')
#   get_all_substrings(string).select { |substr| is_palindrome?(substr) }
# end

#############
# def is_palindrome?(string)
#   string.reverse == string
# end

# def leading_substrings(string)
#   (2..string.size).map { |length| string[0, length] } # only returns substrings with size > 1
# end

# def all_substrings(string)
#   (string.size - 1).times.map do |start| # only passes substrings with size > 1 into leading_substrings
#     leading_substrings(string[start..-1])
#   end.flatten
# end

# def palindromes(string)
#   string = string.downcase.gsub(/[^a-z0-9]/, '')
#   all_substrings(string).select { |str| is_palindrome?(str) }
# end

###########
# def leading_substrings(string)
#   (2..string.size).map { |length| string[0, length] } # only returns substrings with size > 1
# end

# def palindromes(string)
#   (string.size - 1).times.map do |start| # only passes substrings with size > 1 into leading_substrings
#     leading_substrings(string[start..-1]).select { |str| is_palindrome?(str) }
#   end.flatten
# end
###########
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

### 3 ALL SUBSTRINGS
# def substrings(string) # uses leading_substrings as a helper method
#   (string.size).times.map do |start|
#     leading_substrings(string[start..-1])
#   end.flatten
# end

# def leading_substrings(string)
#   (1..string.size).map { |num| string[0, num] }
# end


# def substrings(string) # without leading_substrings helper method
#   string.size.times.map do |start|
#     (1..(string.size - start)).map { |num| string[start, num] }
#   end.flatten
# end

# def substrings(s) # one-line version of above
#   s.size.times.map { |i| (1..s.size - i).map { |j| s[i, j] } }.flatten
# end

######## DANIEL CHAE vvvvv
# # recursive version 
# # this one was a bit of a headache, someone please comment if you can make this cleaner

# def substrings(s, iter = true)
#   s.size < 1 ? [] : (substrings(s[...-1], false) << s).concat(iter ? substrings(s[1..]) : [])
# end

# def substrings(string, iterate = true)
#   if string.size < 1
#     [] 
#   else
#     if iterate
#       (substrings(string[...-1], false) << string).concat(substrings(string[1..]))
#     else
#       (substrings(string[...-1], false) << string).concat([])
#     end
#   end
# end
######## DANIEL CHAE ^^^^^^

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

### 2 LEADING SUBSTRINGS
# def leading_substrings(string)
#   string.chars.each_index.map { |idx| string.slice(0, idx + 1) }
# end

# def leading_substrings(string) # iterating directly over the characters
#   string.chars.each_index.map { |idx| string[0..idx] }
# end

# def leading_substrings(string) # iterating over a range
#   (0...string.size).map { |num| string[0..num] }
# end

# def leading_substrings(string) # using #times to iterate
#   (string.size).times.map { |counter| string[0..counter] }
# end

# def leading_substrings(string) # iterating over a range
#   (1..string.size).map { |num| string[0, num] }
# end

# def leading_substrings(string) # using #upto to iterate
#   1.upto(string.size).map { |num| string[0, num] }
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

### 1 SUM OF SUMS
# def sum_of_sums(array)
#   sum = 0
#   array.each_with_index do |num, idx|
#     sum += (num * (array.size - idx))
#   end
#   sum
# end

# def sum_of_sums(array)
#   array.each_with_index.with_object([]) do |(num, idx), sums|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject([]) do |sums, (num, idx)|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.map.with_index { |num, idx| num * (array.size - idx) }.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   size = 1
#   loop do
#     sum += array.take(size).sum
#     size += 1
#     break if size > array.size
#   end
#   sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.each_with_object([]) do |num, arr|
#     arr << num + sum
#     sum += num
#   end.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.map { |num| sum += num }.sum
# end

# def sum_of_sums(array)
#   array.each_index.map { |idx| array.take(idx + 1).sum }.sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |num| array.take(num).sum }.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject(0) do |sum, (num, idx)|
#     sum += (num * (array.size - idx))
#   end
# end

# def sum_of_sums(array)
#   array.each_index.inject(0) { |sum, idx| sum += array.take(idx + 1).sum }
# end

# p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35
