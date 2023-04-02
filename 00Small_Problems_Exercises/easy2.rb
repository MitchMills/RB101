### 8 SUM OR PRODUCT OF CONSECUTIVE INTEGERS
number = 0
loop do
  print "Please enter an integer greater than 0: "
  number = gets.chomp.to_i
  break if number > 0
  puts "Try again!"
end

choice = nil
loop do
  print "Enter 's' to compute the sum, 'p' to compute the product: "
  choice = gets.chomp
  break if ['s', 'p'].include?(choice)
  puts "Try again!"
end

result = 1
range = (2..number)
if choice == 's'
  range.each { |num| result += num }
  puts "The sum of the integers between 1 and 5 is #{result}."
else
  range.each { |num| result *= num }
  puts "The product of the integers between 1 and 5 is #{result}."
end




    



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
