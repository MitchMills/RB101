# 10 PALINDROMIC NUMBERS
def palindromic_integer?(number)
  # number == number.digits.join.to_i
  number.to_s == number.to_s.reverse
end

p palindromic_integer?(34543) == true
p palindromic_integer?(123210) == false
p palindromic_integer?(22) == true
p palindromic_integer?(5) == true


# 9 PALINDROMIC STRINGS II
# def real_palindrome?(string)
#   clean_string = string.downcase.delete('^a-z0-9')
#   clean_string == clean_string.reverse
# end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false


# 8 PALINDROMIC STRINGS I
# def palindrome?(object)
#   object == object.reverse
# end

# p palindrome?([1, 2, 3]) == false
# p palindrome?([1, 2, 3, 2, 1]) == true
# p palindrome?([]) == true
# p palindrome?(['a']) == true
# p palindrome?(['a', 'b', 'a']) == true
# puts

# # def string_palindrome?(string)
# #   string == string.reverse
# # end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true


# 7 ODD LISTS
# def oddities(array)
#   array.select {|element| array.index(element).even?}
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# 6 EXCLUSIVE OR
# def xor?(arg1, arg2)
#   # return true if arg1 && !arg2
#   # return true if !arg1 && arg2
#   # false
#   if (arg1 && !arg2) || (!arg1 && arg2)
#     true
#   else
#     false
#   end
# end

# # (true && !false) || (!true && false)
# # true || false

# # (false && !true) || (!false && true)
# # false || true

# # (true && !true) || (!true && true)
# # false || false

# # (false && !false) || (!false && false)
# # false || false

# puts xor?(5.even?, 4.even?) # (false, true) --> true
# puts xor?(5.odd?, 4.odd?) #   (true, false) --> true
# puts xor?(5.odd?, 4.even?) #  (true, true) --> false
# puts xor?(5.even?, 4.odd?) #  (false, false) --> false


# 5 SQUARING AN ARGUMENT
# def multiply(num1, num2)
#   num1 * num2
# end

# def power(num, to_the_n)
#   multiply(num, 1) ** to_the_n

#   # result = 1
#   # if to_the_n > 1
#   #   while to_the_n > 1
#   #     result = result * multiply(num, result)
#   #     to_the_n -= 1
#   #   end
#   # else
#   #   result = num
#   # end
#   # result

# end

# puts power(5, 3)
# puts power(2, 4)
# puts power(5, 1)
# puts power(4, 3)



# 4 MULTIPLYING TWO NUMBERS
# def multiply(num1, num2)
#   num1 * num2
# end

# p multiply([1, 2, 3], 3)


# 3 COUNTING THE NUMBER OF CHARACTERS
# def get_char_count(string)
# #   # char_count = 0
# #   # string.each_char do |char|
# #   #   char_count += 1 if char != ' '
# #   # end
# #   # char_count

# # char_count = string.split.join.size

#   char_count = string.delete(' ').size
# end

# def count_characters
#   print "Please write a word or multiple words: "
#   string = gets.chomp
#   char_count = get_char_count(string)
#   puts "There are #{char_count} characters in \"#{string}\"."
# end

# count_characters()

# 2 ARITHMETIC INTEGER
# print "==> Enter the first number: "
# first_number = gets.to_i
# print "==> Enter the second number: "
# second_number = gets.to_i

# operators = [:+, :-, :*, :/, :%, :**]

# operators.each do |op|
#   puts "#{first_number} #{op} #{second_number} = #{first_number.method(op).(second_number)}"
# end


# 1 SEARCHING 101
# numbers_hash = { 
#   '1st' => 0,
#   '2nd' => 0,
#   '3rd' => 0,
#   '4th' => 0,
#   '5th' => 0,
#   'last' => 0
# }

# numbers_hash.each do |key, value|
#   print "Enter the #{key} number: "
#   numbers_hash[key] = gets.to_i
# end

# numbers_array = numbers_hash.values.slice(0, 5)

# if numbers_array.include?(numbers_hash['last'])
#   puts "The number #{numbers_hash['last']} appears in #{numbers_array}."
# else
#   puts "The number #{numbers_hash['last']} does not appear in #{numbers_array}."
# end
