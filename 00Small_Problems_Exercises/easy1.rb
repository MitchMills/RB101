# 4 HOW MANY?
def count_occurrences(vehicle)
  
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)


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
