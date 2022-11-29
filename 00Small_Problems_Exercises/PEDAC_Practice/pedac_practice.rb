# string1 = "codewars"
# string2 = "hackerrank"

# array1 = %w(c o d e w a r s)
# array2 = %w(h a c k e r r a n k)

def anagram_difference(string1, string2)
  p "----------"
  array1 = string1.chars
  array2 = string2.chars
  both_arrays = array1 + array2
  
  not_in_common = []
  not_in_common << array1.reject do |char| 
    array2.include?(char)
  end
  p "NIC1: #{not_in_common}"

  not_in_common << array2.reject do |char| 
    array1.include?(char)
  end
  p "NIC2: #{not_in_common}"
  
end

# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'a') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
anagram_difference('aab', 'a') #== 2
anagram_difference('a', 'aab') #== 2
# p anagram_difference('codewars', 'hackerrank') == 10
# p anagram_difference('abcdeee', 'fghieee') #== 8
anagram_difference('abcdeee', 'fghiee') #== 9

