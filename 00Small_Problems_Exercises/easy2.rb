# 6 ODD NUMBERS



# 5 GREETING A USER
# def greet_user
#   print "What is your name? "
#   name = gets.chomp
#   # if name == "#{name.chop}!"
#   if name[-1] == '!'
#     puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
#   else
#     puts "Hello #{name}."
#   end
# end

# greet_user()

# 4 WHEN WILL I RETIRE?
# def when_will_retire
#   current_year = Time.now.year
#   current_age = get_current_age
#   retirement_age = get_retirement_age
#   years_to_work = retirement_age - current_age
#   retirement_year = current_year + years_to_work
#   puts "It's #{current_year}. You will retire in #{retirement_year}."
#   puts "You have only #{years_to_work} years of work to go!"
# end

# def get_current_age
#   print "What is your age? "
#   current_age = gets.to_i
# end

# def get_retirement_age
#   print "At what age would you like to retire? "
#   retirement_age = gets.to_i
# end

# when_will_retire()


# 3 TIP CALCULATOR
# def tip_calculator
#   bill = get_bill
#   tip_percent = get_tip_percent
#   tip = (bill * tip_percent).round(2)
#   total = bill + tip
#   puts "The tip is $#{format("%.2f", tip)}"
#   puts "The total is $#{format("%.2f", total)}"
# end

# def get_bill
#   puts "What is the bill?"
#   bill = gets.chomp.to_f.round(2)
# end

# def get_tip_percent
#   puts "What is the tip_percentage?"
#   tip_percent = (gets.chomp.to_f/100).round(2)
# end

# tip_calculator()


# 2 HOW BIG IS THE ROOM?
# SQMETERS_TO_SQFEET = 10.7639

# def get_length_in_meters
#   print "Enter the length of the room in meters: "
#   length = gets.chomp.to_f
# end

# def get_width_in_meters
#   print "Enter the width of the room in meters: "
#   width = gets.chomp.to_f
# end

# def calculate_area_in_meters
#   length = get_length_in_meters
#   width = get_width_in_meters
#   area_in_meters = (length * width).round(2)
# end

# def how_big
#   area_in_meters = calculate_area_in_meters
#   area_in_feet = (area_in_meters * SQMETERS_TO_SQFEET).round(2)
#   puts "The area of the room is #{area_in_meters} square meters (#{area_in_feet} square feet)."
# end

# how_big


# 1 HOW OLD IS TEDDY?
# def age_of_somebody
#   name = get_name
#   age = rand(20..200)
#   puts "#{name} is #{age} years old!"
# end

# def get_name
#   print "Please enter a name: "
#   name = gets.chomp
#   name.empty? ? 'Teddy' : name
# end

# age_of_somebody
