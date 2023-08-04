### 7.2 PALINDROMIC STRING I
def palindrome?(string)
  
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

### 6.2 EXCLUSIVE OR
# def xor?(left, right)
#   !!left == !right
# end

# p xor?(false, true) == true
# p xor?(nil, 42) == true
# p xor?('This is truthy', (puts "This is truthy")) == true
# p xor?([1, 2, 3].include?(4), 5.odd?) == true
# p xor?(['a', 'b', 'c'], {a: 1, b: 2, c: 3})

=begin
When comparing two expressions that evaluate to `true` or `false`, there are four possible combinations:
- `true`, `true`
- `false`, `true`
- `true`, `false`
- `false`, `false`

With the `&&` operator, if the first operand evaluates to `false`, the second operand doesn't need to be evaluated to know the outcome.

With the `||` operator, if the first operand evaluates to `true`, the second operand doesn't need to be evaluated to  know the outcome.

But with an exclusive-or operator, whether the first operand evaluates to `true` or `false`, we still need to evaluate the second operand to know the outcome, so short-circuit evaluation doesn't make sense.
=end

### 5.2 SQUARING AN ARGUMENT
# def power(num, exponent)
#   total = 1
#   exponent.times { total = multiply(num, total) }
#   total
# end

# def square(num)
#   multiply(num, num)
# end

# def multiply(num1, num2)
#   num1 * num2
# end

# p power(3, 2)

### 4.2 
# def multiply(num1, num2)
#   num1 * num2
# end

# # p multiply(5, 3)
# p multiply([1, 2], ', ')

### 3.2 COUNTING THE NUMBER OF CHARACTERS
# def characters
#   input = get_input()
#   count = count_characters(input)
#   display_result(input, count)
# end

# def get_input
#   print '=> Please write word or multiple words: '
#   gets.chomp
# end

# def count_characters(input)
#   input.gsub(' ', '')).size
# end

# def display_result(input, count)
#   puts "There are #{count} characters in \"#{input}\"."
# end

# characters

### 2.2 ARITHMETIC INTEGER
# def operate
#   system 'clear'
#   numbers = get_numbers
#   results = get_results(numbers)
#   display_results(numbers, results)
# end

# def get_numbers
#   ['first', 'second'].map do |ordinal|
#     print "==> Enter the #{ordinal} number: "
#     gets.chomp.to_f
#   end
# end

# def get_results(numbers)
#   num1, num2 = numbers
#   operations = [:+, :-, :*, :/, :%, :**]
#   results = operations.map do |operation|
#     next "can't divide by zero." if (num2 == 0 && [:/, :%].include?(operation))
#     numbers.inject(operation)
#   end
#   operations.zip(results).to_h
# end

# def display_results(numbers, results)
#   num1, num2 = numbers.map { |num| format_number(num) }
#   results.each do |operation, result|
#     result = format_number(result) unless result.class == String
#     puts "#{num1} #{operation} #{num2} = #{result}"
#   end
# end

# def format_number(number)
#   sprintf('%.2f', number).reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse.gsub('.00','')
# end

# operate

### 1.2 SEARCHING 101
# def check_membership
#   system 'clear'
#   inputs = get_inputs
#   result = determine_result(inputs)
#   display_result(inputs, result)
# end

# def get_inputs
#   ordinals = %w(1st 2nd 3rd 4th 5th last)
#   numbers = ordinals.map do |ordinal|
#     get_input(ordinal)
#   end
#   [numbers, numbers.pop]
# end

# def get_input(ordinal)
#   loop do
#     print "==> Enter the #{ordinal} integer: "
#     input = gets.chomp
#     return input.to_i if valid_integer?(input)

#     invalid_entry
#   end
# end

# def valid_integer?(input)
#   input.to_i.to_s == input
# end

# def invalid_entry
#   puts
#   puts "Please enter only integers."
#   puts
# end

# def determine_result(inputs)
#   numbers, target = inputs
#   numbers.include?(target)
# end

# def display_result(inputs, result)
#   numbers, target = inputs
#   puts
#   print "The number #{target} "
#   puts (result ? "appears in #{numbers}." : "does not appear in #{numbers}.")
# end

# check_membership

### 10 UPPERCASE CHECK
# def uppercase?(string)
#   string == string.upcase
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

### 9 PALINDROMIC NUMBERS
# def palindromic_number?(num)
#   num.digits == num.digits.reverse
# end

# def palindromic_number?(num)
#   num.to_s == num.to_s.reverse
# end

# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

### 8 PALINDROMIC STRINGS II
# def real_palindrome?(string)
#   stripped_string = string.downcase.chars.select do |char|
#                       ('a'..'z').include?(char) || ('0'..'9').include?(char)
#                     end.join
#   stripped_string == stripped_string.reverse
# end

# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   string == string.reverse
# end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

### 7 PALINDROMIC STRINGS I
# def palindrome?(input)
#   input.reverse == input
# end

# def palindrome?(input)
#   reverse = input.class.new
#   (input.size - 1).downto(0) do |idx|
#     reverse << input[idx]
#   end
#   input == reverse
# end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
# p palindrome?([1, 2, 3, 2, 1]) == true
# p palindrome?(['ant', 'man', 'ant']) == true

### 6 EXCLUSIVE OR
# def xor?(val1, val2)
#   !val1 != !val2
# end

# def xor?(value1, value2)
#   !!( (value1 && !value2) || (value2 && !value1) )
# end

# def xor?(arg1, arg2)
#   count = 0
#   count += 1 if !!arg1
#   count += 1 if !!arg2
#   count == 1
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
