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
