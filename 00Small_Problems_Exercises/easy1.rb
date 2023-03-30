### 7 MADLIBS


### 6 RIGHT TRIANGLES
# def triangle(num)
#   (1..num).each do |line_number|
#     spaces = ' ' * (num - line_number)
#     stars = '*' * line_number
#     puts spaces + stars
#   end
# end

# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   while spaces >= 0
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

# def triangle(num)
#   line = 1
#   until line > num
#     puts ("*" * line).ljust(num)
#     line += 1
#   end
# end

# def triangle(size)
#   stars = size
#   until stars == 0
#     puts ("*" * stars).rjust(size)
#     stars -= 1
#   end
# end

def triangle(size, corner)
  if corner[0] == 'u'
    stars = size
  elsif corner[0] == 'l'
    stars = 1
  end

  if corner[1] == 'l'
    line = ("*" * stars).ljust(size)
  elsif corner[1] == 'r'
    line = ("*" * stars).rjust(size)
  end

  if corner[0] == 'u'
    until stars == 0
      puts line
      stars -= 1
    end
  elsif corner[0] == 'l'
    until stars > size
      puts line
      stars += 1
    end
  end

end

triangle(5, 'ul')
triangle(5, 'ur')
triangle(5, 'll')
triangle(5, 'lr')

### 5 BANNERIZER
# def print_in_box(string)
#   line = "+ #{'-' * string.size} +"
#   side = "| #{' ' * string.size} |"

#   puts line
#   puts side
#   puts "| #{string} |"
#   puts side
#   puts line

# end

# print_in_box("To boldly go")

### 4 WHAT'S MY BONUS?
# def calculate_bonus(salary, eligible)
#   eligible ? (salary / 2) : 0
# end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

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

# def stringy(size, start_digit = 1)
#   digits = []
#   # adjustment = (start_digit == 1) ? 0 : 1
  
#   size.times do |idx|
#     # idx += adjustment
#     idx =+ 1 if start_digit == 0
#     digit = (idx.even?) ? 1 : 0
#     digits << digit
#   end

#   digits.join
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# puts stringy(6, 0) == '010101'
# puts stringy(9, 0) == '010101010'
# puts stringy(4, 0) == '0101'
# puts stringy(7, 0) == '0101010'

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
