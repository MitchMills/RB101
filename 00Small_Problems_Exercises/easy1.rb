### 4 WHAT'S MY BONUS?


### 3 STRINGY STRINGS
# def stringy(integer)

#   # digits = []

#   # integer.times do |idx|
#   #   digit = (idx.even?) ? 1 : 0
#   #   digits << digit
#   # end
#   # digits.join

#   characters = []

#   integer.times do |idx|
#     char = (idx.even?) ? '1' : '0'
#     characters << char
#   end

#   characters.join

#   # string = ''
#   # counter = 1

#   # loop do
#   #   if counter.odd?
#   #     string = string + '1'
#   #   else
#   #     string = string + '0'
#   #   end
#   #   break if counter == integer
#   #   counter += 1
#   # end

#   # (1..integer).each do |num|
#   #   if num.odd?
#   #     string = string + '1'
#   #   else
#   #     string = string + '0'
#   #   end
#   # end

#   # (1..integer).each do |num|
#   #   character = (num.odd?) ? '1' : '0'
#   #   string = string + character
#   # end
  
#   # string

# end

# def stringy(integer, start_digit = 1)
#   digits = []

#   integer.times do |idx|
#     if start_digit == 1
#       digit = (idx.even?) ? 1 : 0
#     else
#       digit = (idx.even?) ? 0 : 1
#     end
#     digits << digit
#   end

#   digits.join
# end

# puts stringy(6, 0) == '010101' # '101010'
# puts stringy(9, 0) == '010101010' # '101010101'
# puts stringy(4, 0) == '0101' # '1010'
# puts stringy(7, 0) == '0101010' # '1010101'

### 2 ODD
# def is_odd?(integer)
#   # integer.odd?

#   # integer % 2 != 0

#   integer.remainder(2) != 0
# end

# puts is_odd?(2) == false
# puts is_odd?(5) == true
# puts is_odd?(-17) == true
# puts is_odd?(-8) == false
# puts is_odd?(0) == false
# puts is_odd?(7) == true

### 1 REPEAT YOURSELF
# def repeat(string, integer)
#   counter = integer
#   # loop do
#   #   puts string
#   #   counter -= 1
#   #   break if counter == 0
#   # end

#   # while counter > 0
#   #   puts string
#   #   counter -= 1
#   end

#   # (1..integer).each {puts string}
  
#   # integer.times {puts string}
# end

# repeat('Hello', 3)
