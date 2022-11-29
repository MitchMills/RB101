# string1 = "codewars"
# string2 = "hackerrank"

# array1 = %w(c o d e w a r s)
# array2 = %w(h a c k e r r a n k)

def anagram_difference(string1, string2)
  puts "----------"
  array1 = string1.chars
  p array1
  array2 = string2.chars
  p array2
  puts

  in_common = []
  array1.each do |char|
    in_common << char if array2.include?(char)
  end
  p in_common
  puts
  p array1.intersection(in_common)
  p array2.intersection(in_common)
  puts
  
  p sum = (string1.size + string2.size) - (array1.intersection(in_common).size * 2)
  # sum1 = (string1.size - in_common.size) + (string2.size - in_common.size)
  # p sum1
  sum2 = (string1.size + string2.size) - (in_common.size * 2)
  # p sum2
end

# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'a') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') #== 2
p anagram_difference('a', 'aab') #== 2
# p anagram_difference('codewars', 'hackerrank') == 10
# p anagram_difference('abcdeee', 'fghieee') #== 8
p anagram_difference('abcdeee', 'fghiee') #== 9

