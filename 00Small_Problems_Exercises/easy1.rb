# 10 WHAT'S MY BONUS
def calculate_bonus(salary, bonus_status)
  bonus_status ? (salary / 2.0) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


# 9 SUM OF DIGITS
# def sum(integer)
#   integer.digits.sum
# end

# def sum(integer)
#   str_array = integer.to_s.chars
#   int_array = str_array.map { |str| str.to_i }
#   sum = int_array.reduce(:+)
# end

# def sum(integer)
#   sum = 0

#   str_array = integer.to_s.chars

#   str_array.each do |digit|
#     sum += digit.to_i
#   end

#   sum
# end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45


# 8 ARRAY AVERAGE
# def average(array)
#   array.sum / array.size.to_f
# end

# puts average([1, 6]) #== 3
# puts average([1, 5, 87, 45, 8, 8]) #== 25
# puts average([9, 47, 23, 95, 16, 52]) #== 40


# 7 STRINGY STRINGS
# def stringy(integer, start = 1)
#   output_string = ''

#   integer.times do |index|
#     if start == 0
#       number = index.even? ? '0' : '1'
#     else
#       number = index.even? ? '1' : '0'
#     end
#     output_string << number
#   end

#   output_string
# end

# def stringy(integer)
#   output_string = ''
#   (1..integer).each do |int|
#     if int.odd?
#       output_string << '1'
#     else
#       output_string << '0'
#     end
#   end
#   output_string
# end

# def stringy(integer)
#   output_string = ''
#   index = 0
#   while output_string.size < integer
#     if index.even?
#       output_string << '1'
#     else
#       output_string << '0'
#     end
#     index += 1
#   end
#   output_string
# end

# puts stringy(6, 0) #== '101010'
# puts stringy(9, 1) #== '101010101'
# puts stringy(4, 2) #== '1010'
# puts stringy(7, 0) #== '1010101'


# 6 REVERSE IT (Part 2)
# def reverse_words(string)
#   words = string.split

#   words.each do |word|
#     word.reverse! if word.size >= 5
#   end

#   words.join(' ')
# end

# puts reverse_words('Professional') == 'lanoisseforP'
# puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
# puts reverse_words('Launch School') == 'hcnuaL loohcS'


# 5 REVERSE IT (Part 1)
# def reverse_sentence(sentence)
#   sentence.split.reverse.join(' ')
# end

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# 4 HOW MANY?
# def count_occurrences(vehicles)
#   vehicle_counts = {}

#   vehicles.uniq.each do |vehicle|
#     vehicle_counts[vehicle] = vehicles.count(vehicle)
#   end

#   vehicle_counts.each do |vehicle, count|
#     puts "#{vehicle} => #{count}"
#   end
# end

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)


# 3 LIST OF DIGITS
# def digit_list(integer)
#   integer.digits.reverse
# end

# def digit_list(number)
#   digits = []
#   p number
#   loop do
#     number, remainder = number.divmod(10)
#     p number
#     p remainder
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end

# The Long Way:
# def digit_list(integer)
#   digits_array = []
#   places = integer.to_s.size
#   current_place = places
#   current_number = integer
#   current_digit = 0

#   while current_place > 0
#     divisor = 10**(current_place - 1)
#     current_digit = (current_number / divisor)

#     digits_array << current_digit

#     current_number -= divisor * current_digit
#     current_place -= 1
#   end
#   digits_array
# end

# p digit_list(12345) # == [1, 2, 3, 4, 5]     # => true
# p digit_list(7) # == [7]                     # => true
# p digit_list(375290) # == [3, 7, 5, 2, 9, 0] # => true
# p digit_list(444) # == [4, 4, 4]             # => true


# 2 ODD
# def is_odd?(integer)
#   integer.remainder(2) != 0
# end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true


# 1 REPEAT YOURSELF
# def repeat(string, reps)
#   reps.times { puts string }
# end

# repeat('Hello', 3)
