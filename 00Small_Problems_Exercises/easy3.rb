### 7 PALINDROMIC STRINGS I
def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

### 6 EXCLUSIVE OR
# def xor?(value1, value2)
#   !!( (value1 && !value2) || (value2 && !value1) )
# end

# def xor?(arg1, arg2)
#   count = 0
#   count += 1 if arg1
#   count += 1 if arg2
#   return true if count == 1
#   false
# end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

### 5 SQUARING AN ARGUMENT
# def multiply(num1, num2)
#   num1 * num2
# end

# def square(num)
#   multiply(num, num)
# end

# def powered(num, exponent)
#   result = num
#   (exponent-1).times do
#     result = multiply(result, num)
#   end
#   result
# end

# # p square(5) == 25
# # p square(-8) == 64
# p powered(2, 2) == 4
# p powered(2, 3) == 8
# p powered(3, 3) == 27

### 4 MULTIPLYING TWO NUMBERS
# def multiply(num1, num2)
#   num1 * num2
# end

# p multiply(['a', 'b'], 3)

### 3 COUNTING THE NUMBER OF CHARACTERS
# print "Please write word or multiple words: "
# words = gets.chomp
# char_count = words.delete(" ").length
# puts "There are #{char_count} characters in \"#{words}\"."

### 2 ARITHMETIC INTEGER
# OPERATIONS = [:+, :-, :*, :/, :%, :**]

# def get_number(order)
#   print "Enter the #{order} number: "
#   number = gets.chomp.to_i
# end

# def get_numbers
#   numbers = []
#   numbers << get_number("first")
#   numbers << get_number("second")
# end

# def get_result(numbers, operation)
#   numbers.inject(operation)
# end

# def display_results
#   numbers = get_numbers
#   OPERATIONS.each do |op|
#     puts "#{numbers[0]} #{op} #{numbers[1]} = #{get_result(numbers, op)}"
#   end
# end

# display_results

### 1 SEARCHING 101
# def suffix(num)
#   case num
#   when 1 then "st"
#   when 2 then "nd"
#   when 3 then "rd"
#   else "th"
#   end
# end

# numbers = []

# 5.times do |idx|
#   suffix =  suffix(idx + 1)
#   print "Enter the #{idx + 1}#{suffix} number: "
#   number = gets.chomp.to_i
#   numbers << number
# end

# print "Enter the last number: "
# last_number = gets.chomp.to_i

# result = numbers.include?(last_number) ? "appears" : "does not appear"

# puts "The number #{last_number} #{result} in #{numbers}."
