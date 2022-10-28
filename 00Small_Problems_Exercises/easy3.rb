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
