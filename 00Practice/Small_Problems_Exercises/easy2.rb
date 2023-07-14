

### HOW BIG IS THE ROOM?
SQUARE_FEET_PER_SQUARE_METER = 10.7639
SQUARE_INCHES_PER_SQUARE_METER = 1550.0031
SQUARE_CENTIMETERS_PER_SQUARE_METER = 10000

SQUARE_METERS_PER_SQUARE_FOOT = 0.0929
SQUARE_INCHES_PER_SQUARE_FOOT = 144
SQUARE_CENTIMETERS_PER_SQUARE_FOOT = 929.0304

# keys in outer hash are starting unit; keys in inner hashes are target units
CONVERSIONS = {
  'meters' => {
    'square feet' => SQUARE_FEET_PER_SQUARE_METER
    'square inches' => SQUARE_INCHES_PER_SQUARE_METER
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_METER
  },
  'feet' => {
    'square inches' => SQUARE_INCHES_PER_SQUARE_FOOT,
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_FOOT
    'square meters' => SQUARE_METERS_PER_SQUARE_FOOT
  }
}

def display_area(unit, target_units)
  area = get_input(unit)
  puts "The area of the room is #{area} square #{unit}."
  display_conversions(area, unit, target_units)
end

def get_input(unit)
  length, width = ['length', 'width'].map do |dimension|
    print "Enter the #{dimension} of the room in #{unit}: "
    gets.chomp
  end
  calculate_area(length.to_f, width.to_f).round(2)
end

def calculate_area(length, width)
  length * width
end

def display_conversions(area, unit, target_units)
  target_units.each do |target_unit|
    converted_area = get_converted_area(area, unit, target_unit).round(2)
    puts "(#{converted_area} #{target_unit})"
  end
end

def get_converted_area(area, unit, target_unit)
  converter = get_converter(unit, target_unit)
  area * converter
end

def get_converter(unit, target_unit)
  CONVERSIONS[unit][target_unit]
end

display_area('meters', ['square feet'])
display_area('feet', ['square inches', 'square centimeters'])

SQUARE_FEET_PER_SQUARE_METER = 10.7639

def display_area
  square_meters = get_input
  square_feet = convert_to_square_feet(square_meters).round(2)
  puts "The area of the room is #{square_meters} square meters " +
    "(#{square_feet} square feet)."
end

def get_input
  length, width = ['length', 'width'].map do |dimension|
    print "Enter the #{dimension} of the room in meters: "
    gets.chomp
  end
  area = calculate_area(length.to_f, width.to_f).round(2)
end

def calculate_area(length, width)
  length * width
end

def convert_to_square_feet(square_meters)
  square_meters * SQUARE_FEET_PER_SQUARE_METER
end

display_area




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
