### 10.2 
# def negative(num)
#   num > 0 ? -num : num
# end

# def negative(num)
#   num.positive? ? -num : num
# end

# def negative(num)
#   -num.abs
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0

### 9.2 STRING ASSIGNMENT
# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

=begin
Line 4 will output the string `BOB` twice, on separate lines. Local variable `name` was initialized on line 1 and set to reference the String object 'Bob'. Local variable `save_name` was initialized on line 2 and set to reference the same object as `name`. Since both variables reference the same object, when the `String#upcase!` method is called on line 3 and mutates the calling object, both variables reflect that change. They both still reference the same String object, which has been mutated and now has the value `BOB`.
=end

### 8.2 SUM OR PRODUCT OF CONSECUTIVE INTEGERS
# def sum_or_product
#   system 'clear'
#   inputs = get_inputs
#   result = get_result(inputs)
#   display_result(inputs, result)
# end

# def get_inputs
#   integer = get_integer
#   operation = get_operation
#   [integer, operation]
# end

# def get_integer
#   loop do
#     print "Please enter an integer greater than 0: "
#     input = gets.chomp
#     return input.to_i if valid_integer?(input)
#     invalid_entry
#   end
# end

# def valid_integer?(input)
#   (input.to_i.to_s == input) && (input.to_i > 0)
# end

# def invalid_entry
#   puts "I'm sorry, that's not a valid entry."
#   puts
# end

# def get_operation
#   loop do
#     print "Enter 's' to compute the sum, 'p' to compute the product: "
#     choice = gets.chomp.downcase
#     return get_operator(choice) if %w(s p).include?(choice)
#     invalid_entry
#   end
# end

# def get_operator(choice)
#   choice == 's' ? [:+, 'sum'] : [:*, 'product']
# end

# def get_result(inputs)
#   integer, operation = inputs
#   (1..integer).inject(operation[0])
# end

# def display_result(inputs, result)
#   integer, operation = inputs
#   puts "The #{operation[1]} of the integers between 1 and #{integer} is " +
#     "#{result}."
# end

# sum_or_product


### 7.2 EVEN NUMBERS
# (2..98).step(2) { |num| puts num }

# (2..98).%(2) { |num| puts num }

# (1..49).each { |num| puts (num * 2) }

# puts (1..99).select { |num| num.even? }

# puts (1..99).select(&:even?)

# 1.upto(99) { |num| puts num if num.even? }

# 1.upto(49)  { |num| puts (num * 2) }

# 49.times { |num| puts ((num + 1) * 2) }

### 6.2 ODD NUMBERS
# (1..99).step(2) { |num| puts num }

# (1..99).%(2) { |num| puts num }

# (0..49).each { |num| puts (num * 2) + 1 }

# puts (1..99).select { |num| num.odd? }

# puts (1..99).select(&:odd?)

# 1.upto(99) { |num| puts num if num.odd? }

# 0.upto(49)  { |num| puts (num * 2) + 1 }

# 50.times { |num| puts (num * 2) + 1 }



# current_number = 1

# loop do
#   puts current_number
#   current_number += 2
#   break if current_number > 99
# end

# while current_number <= 99
#   puts current_number
#   current_number += 2
# end

# until current_number > 99
#   puts current_number
#   current_number += 2
# end

### 5.2 GREETING A USER
# def greet_user
#   name = get_name
#   display_response(name)
# end

# def get_name
#   print "What is your name? "
#   gets.chomp
# end

# def display_response(name)
#   speak = "Hello #{name}."
#   scream = "#{speak[0..-3].upcase}. WHY ARE WE SCREAMING?"
#   puts (name[-1] == '!' ? scream : speak)
# end

# greet_user

### 4.2 WHEN WILL I RETIRE?
# CURRENT_YEAR = Time.now.year

# def retirement_calculator
#   ages = get_ages
#   years = get_years(ages)
#   display_results(years)
# end

# def get_ages
#   questions = ["What is your age? ", "At what age would you like to retire? "]
#   questions.map do |question|
#     print question
#     gets.chomp.to_i
#   end
# end

# def get_years(ages)
#   current_age, retirement_age = ages
#   years_to_retirement = retirement_age - current_age
#   retirement_year = CURRENT_YEAR + years_to_retirement
#   [years_to_retirement, retirement_year]
# end

# def display_results(years)
#   years_to_retirement, retirement_year = years
#   puts
#   puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
#   puts "You have only #{years_to_retirement} years of work to go!"
# end

# retirement_calculator


### 3.2 TIP CALCULATOR
# PERCENT_DIVISOR = 100.0

# def tip_calculator
#   input = get_input
#   results = get_results(input)
#   display_results(results)
# end

# def get_input
#   ['bill', 'tip percentage'].map do |category|
#     print "What is the #{category}?: "
#     gets.chomp.to_f
#   end
# end

# def get_results(input)
#   bill, tip_percentage = input
#   tip = bill * (tip_percentage / PERCENT_DIVISOR)
#   total = bill + tip
#   ['tip', 'total'].zip([tip, total]).to_h
# end

# def display_results(results)
#   results.each do |label, result|
#     puts "The #{label} is #{format_currency(result)}"
#   end
# end

# def format_currency(amount)
#   basic = sprintf('%.2f', amount)
#   with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
#   final = with_commas.prepend('$')
# end

# tip_calculator

### 2.2 HOW BIG IS THE ROOM?
SQUARE_FEET_PER_SQUARE_METER = 10.7639
SQUARE_INCHES_PER_SQUARE_METER = 1550.0031
SQUARE_CENTIMETERS_PER_SQUARE_METER = 10000

SQUARE_METERS_PER_SQUARE_FOOT = 0.0929
SQUARE_INCHES_PER_SQUARE_FOOT = 144
SQUARE_CENTIMETERS_PER_SQUARE_FOOT = 929.0304

# keys in outer hash are starting unit; keys in inner hashes are target units
CONVERSIONS = {
  'square meters' => {
    'square feet' => SQUARE_FEET_PER_SQUARE_METER,
    'square inches' => SQUARE_INCHES_PER_SQUARE_METER,
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_METER
  },
  'square feet' => {
    'square inches' => SQUARE_INCHES_PER_SQUARE_FOOT,
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_FOOT,
    'square meters' => SQUARE_METERS_PER_SQUARE_FOOT
  }
}

def find_area(start_unit, target_units)
  dimensions = get_input(start_unit)
  area = calculate_area(dimensions)
  display_area(area, start_unit)
  units = [start_unit, target_units]
  display_conversions(area, units)
end

def get_input(start_unit)
  base_unit = start_unit.split[1]
  input = ['length', 'width'].map do |dimension|
    print "Enter the #{dimension} of the room in #{base_unit}: "
    gets.chomp.to_f
  end
end

def calculate_area(dimensions)
  length, width = dimensions
  length * width
end

def display_area(area, start_unit)
  puts "The area of the room is #{format_area(area)} #{start_unit}."
end

def format_area(area)
  sprintf('%.2f', area).reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
end

def display_conversions(area, units)
  start_unit, target_units = units
  target_units.each do |target_unit|
    converted_area = get_converted_area(area, start_unit, target_unit)
    puts "(#{format_area(converted_area)} #{target_unit})"
  end
end

def get_converted_area(area, start_unit, target_unit)
  converter = get_converter(start_unit, target_unit)
  area * converter
end

def get_converter(unit)
  CONVERSIONS[start_unit][target_unit]
end

find_area('square meters', ['square feet'])
puts
find_area('square feet', ['square inches', 'square centimeters'])









### Initial Solution
# SQUARE_FEET_PER_SQUARE_METER = 10.7639

# def find_area
#   length, width = get_input
#   area = calculate_area(length.to_f, width.to_f)
#   square_feet = convert_to_square_feet(area)
#   display_area(area, square_feet)
# end

# def get_input
#   length, width = ['length', 'width'].map do |dimension|
#     print "Enter the #{dimension} of the room in meters: "
#     gets.chomp
#   end
# end

# def calculate_area(length, width)
#   length * width
# end

# def convert_to_square_feet(square_meters)
#   square_meters * SQUARE_FEET_PER_SQUARE_METER
# end

# def display_area(area, square_feet)
#   puts "The area of the room is #{area.round(2)} square meters " +
#     "(#{square_feet.round(2)} square feet)."
# end

# find_area

### 1.2 HOW OLD IS TEDDY?
# def display_name_and_age
#   name = get_name
#   age = rand(20..200)
#   puts "#{name} is #{age} years old!"
# end

# def get_name
#   print "Please enter a name: "
#   name = gets.chomp.strip
#   name = 'Teddy' if name.empty?
#   # name.empty? ? 'Teddy' : name
# end

# display_name_and_age

### 10 ALWAYS RETURN NEGATIVE
# def negative(num)
#   num > 0 ? -num : num
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0

### 9 STRING ASSIGNMENT
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name
=begin
- On line 1 we initialize a variable `name` and assign it to point to a string object with the value 'Bob'.
- On line 2 we initialize a variable `save_name` and assign it to point to the same object as `name` (a string object with value 'Bob')
- On line 3 we invoke the `upcase!` method on `name`. This mutates in place the string object that `name` references. That string object now has the value `BOB`
- Both `name` and `save_name` still point to the same string object. So when `puts` is called on line 4, with `name` and `save_name` passed in as arguments, it will output 'BOB' for both variables.
- This example demonstrates how Ruby appears to use pass by reference when dealing with mutating methods. The value of the referenced object has changed, so both variables are affected.

=end

### 8 SUM OR PRODUCT OF CONSECUTIVE INTEGERS
# number = 0
# loop do
#   print "Please enter an integer greater than 0: "
#   number = gets.chomp.to_i
#   break if number > 0
#   puts "Try again!"
# end

# choice = nil
# loop do
#   print "Enter 's' to compute the sum, 'p' to compute the product: "
#   choice = gets.chomp.downcase
#   break if ['s', 'p'].include?(choice)
#   puts "Try again!"
# end

# result = 1
# range = (2..number)
# if choice == 's'
#   range.each { |num| result += num }
#   puts "The sum of the integers between 1 and #{number} is #{result}."
# else
#   range.each { |num| result *= num }
#   puts "The product of the integers between 1 and #{number} is #{result}."
# end

# if choice == 's'
#   result = (1..number).inject(:+)
#   puts "The sum of the integers between 1 and #{number} is #{result}."
# elsif choice == 'p'
#   result = (1..number).inject(:*)
#   puts "The product of the integers between 1 and #{number} is #{result}."
# end

### 7 EVEN NUMBERS

### 6 ODD NUMBERS
# puts (1..99).reject { |num| num.even? }
# puts (1..99).select { |num| num.odd? }
# puts (1..99).filter { |num| num.odd? }
# puts (1..99).find_all { |num| num.odd? }

# 1.step(to: 99, by: 2) { |num| puts num }

# 99.times do |idx|
#   count = idx + 1
#   puts count if count.odd?
# end

# 50.times do |idx|
#   puts (idx * 2) + 1
# end

# for num in (1..99)
#   puts num if num.odd?
# end

# num = 1
# until num > 99
#   puts num 
#   num += 2
# end

# while num < 100
#   puts num
#   num += 2
# end

# numbers = []
# current_number = 1
# loop do
#   numbers << current_number
#   current_number += 2
#   break if current_number > 99
# end
# puts numbers

# loop do
#   puts num
#   num += 2
#   break if num > 99
# end

# 1.upto(99) { |num| puts num if num.odd? }

# (1..99).each { |num| puts num if num.odd? }

# (1..99).step(2) { |num| puts num}

### 5 GREETING A USER
# print "What is your name? "
# name = gets.chomp

# if name[-1] == "!"
#   puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

### 4 WHEN WILL I RETIRE?
# current_year = Time.now.year

# print "What is your age? "
# current_age = gets.chomp.to_i

# print "At what age would you like to retire? "
# retirement_age = gets.chomp.to_i

# years_to_retirement = retirement_age - current_age
# retirement_year = current_year + years_to_retirement

# puts "It's #{current_year}. You will retire in #{retirement_year}."
# puts "You have only #{years_to_retirement} years of work to go!"

### 3 TIP CALCULATOR
# print "What is the bill? "
# bill = gets.to_f.round(2)

# print "What is the tip percentage? "
# tip_rate = gets.to_f
# tip_percentage = tip_rate / 100

# tip_amount = (bill * tip_percentage).round(2)
# total_payment = bill + tip_amount

# puts "The tip is $#{sprintf("%.2f", tip_amount)}"
# puts "The total is $#{sprintf("%.2f", total_payment)}"

### 2 HOW BIG IS THE ROOM?
# SQU_M_TO_SQU_FT = 10.7639

# print "Enter the length of the room in meters: "
# length = gets.chomp.to_f

# print "Enter the width of the room in meters: "
# width = gets.chomp.to_f

# area_in_squ_meters = (length * width).round(2)
# area_in_squ_feet = (area_in_squ_meters * SQU_M_TO_SQU_FT).round(2)

# puts "The area of the room is #{area_in_squ_meters} square meters (#{area_in_squ_feet} square feet)."

### 1 HOW OLD IS TEDDY?
# age = rand(20..200)
# puts "Teddy is #{age} years old!"
