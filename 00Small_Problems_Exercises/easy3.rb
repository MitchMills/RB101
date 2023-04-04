### 3 COUNTING THE NUMBER OF CHARACTERS


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
