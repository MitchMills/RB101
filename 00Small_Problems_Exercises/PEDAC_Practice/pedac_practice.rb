# string1 = "codewars"
# string2 = "hackerrank"

# array1 = %w(c o d e w a r s)
# array2 = %w(h a c k e r r a n k)

def anagram_difference(string1, string2)
  if string1.size <= string2.size
    short_array = string1.chars
    long_array = string2.chars
  else
    short_array = string2.chars
    long_array = string1.chars
  end

  in_common = []
  short_array.each do |char|
    in_common << char if long_array.include?(char)
  end

  difference = (short_array.size + long_array.size) - (in_common.size * 2)
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
p anagram_difference('abcdeee', 'fghieee') == 8
p anagram_difference('abcdeee', 'fghiee') == 9
p anagram_difference('abcdee', 'fghieee') == 9
