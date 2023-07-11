
### 8.2 REVERSE DIGITS
def reversed_number(num)

end

# p reversed_number(12345) #== 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1



### 7.2 MADLIBS
# CATEGORIES = %w(verb adjective noun adverb)

# def display_madlib
#   words = get_words
#   puts "Do you #{words['verb']} your #{words['adjective']} #{words['noun']} " +
#     "#{words['adverb']}? That's hilarious."
# end

# def get_words
#   input = CATEGORIES.map do |category|
#     article = 'aeiou'.include?(category.chr) ? 'an' : 'a'
#     print "Enter #{article} #{category}: "
#     gets.chomp
#   end
#   CATEGORIES.zip(input).to_h
# end

# display_madlib

### 6.2 RIGHT TRIANGLES
# # Initial Solution
# def triangle(size)
#   (1..size).each do |stars|
#     puts ("*" * stars).rjust(size)
#   end
# end

# triangle(5)

### Further Exploration 1.0
# def triangle(size, vertical = 'bottom', horizontal = 'right')
#   size.times do |num|
#     stars = (vertical == 'top' ? size - num : num + 1)
#     spaces = (vertical == 'top' ? num : size - stars)
#     characters = ['*' * stars, ' ' * spaces]
#     first = (horizontal == 'left') ? 0 : 1
#     puts "#{characters[first]}#{characters[1 - first]}"
#   end
# end

###### FE one-liner DANIEL CHAE
# def triangle(n, o = 0)
#   n.times { |i| puts ("*" * (o < 2 ? (n - i) : i + 1)).rjust(o.odd? ? n : 0).ljust(o.odd? ? 0 : n) }
# end

# def triangle(size, orientation = 0)
#   size.times do |num|
#     stars = (orientation < 2 ? (size - num) : num + 1)
#     rjust_amount = orientation.odd? ? size : 0
#     # ljust_amount = orientation.odd? ? 0 : size
#     puts ("*" * stars).rjust(rjust_amount).ljust(size - rjust_amount) 
#   end
# end

# 4.times do |num|
#   triangle(5, num)
# end
###### FE one-liner DANIEL CHAE

### Further Exploration 2.0
# def triangle(size, vertical = 'bottom', horizontal = 'right')
#   size.times do |num|
#     stars = (vertical == 'top' ? size - num : num + 1)
#     spaces = (horizontal == 'left' ? size : 0)
#     puts ('*' * stars).ljust(spaces).rjust(size - spaces)
#   end
# end

# triangle(5, 'top', 'left')
# triangle(5, 'top', 'right')
# triangle(5, 'bottom', 'left')
# triangle(5, 'bottom', 'right')

### 5.2 BANNERIZER
# Basic Solution
# def print_in_box(string)
#   pattern = ['line', 'side', 'text', 'side', 'line']
#   pattern.each { |line_type| print_line(line_type, string) }
# end

# def print_line(line_type, string)
#   end_character = (line_type == 'line' ? "+" : "|")
#   padding = (line_type == 'line' ? "-" : " ")
#   middle = (line_type == 'text' ? " #{string} ": "#{padding * (string.size + 2)}")
#   puts "#{end_character}#{middle}#{end_character}"
# end

# string = "The quick brown fox"
# print_in_box(string)

# Further Exploration
# WRAP_LIMIT = 76 # Max line length 80 minus two characters before and two characters after for box sides
# TRUNCATE_LIMIT = 73 # 76 minus three characters for ellipsis (...)
# PATTERN = %w(line side text side line)

# def print_in_box(string, action = 'truncate')
#   PATTERN.each { |line_type| print_line(string.strip, action, line_type) }
# end

# def print_line(string, action, line_type)
#   text_lines = get_text_lines(string, action)
#   line_length = text_lines.max { |a, b| a.size <=> b.size }.size

#   if line_type == 'text'
#     display_text_lines(text_lines, line_length)
#   else
#     display_line(line_type, line_length)
#   end
# end

# def get_text_lines(string, action)
#   return [string] unless string.size > WRAP_LIMIT
  
#   break_limit = (action == 'truncate' ? TRUNCATE_LIMIT : WRAP_LIMIT)
#   break_point = find_spaces(string, break_limit).last || break_limit # if no spaces in string, find_spaces returns nil
#   return [string[0...break_point] + "..."] if action == 'truncate'

#   get_wrapped_lines(string)
# end

# def find_spaces(string, break_limit)
#   string.each_char.with_index.filter_map do |char, idx|
#     idx if (char == " ") && (idx <= break_limit)
#   end
# end

# def get_wrapped_lines(string)
#   wrapped_lines = []
#   loop do
#     last_space = find_spaces(string, WRAP_LIMIT).last || WRAP_LIMIT # if no spaces in string, find_spaces returns nil
#     break_point = (string.size < WRAP_LIMIT ? -1 : last_space - 1)
#     wrapped_lines << string[0..break_point].strip
#     break if string.size < WRAP_LIMIT
#     string = string[(break_point + 1)..-1]
#   end
#   wrapped_lines
# end

# def display_text_lines(text_lines, line_length)
#   text_lines.each do |substring|
#     spaces = line_length - substring.size
#     puts "| #{substring}#{" " * spaces} |"
#   end
# end

# def display_line(line_type, line_length)
#   end_character = (line_type == 'line' ? "+" : "|")
#   padding = (line_type == 'line' ? "-" : " ")
#   puts end_character + "#{padding * (line_length + 2)}" + end_character
# end

# string = "the quick brown fox jumps over the lazy dog"

# string = 
# "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod " +
# "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim " + 
# "veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea " + 
# "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate " + 
# "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat " + 
# "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id " + 
# "est laborum."

# string = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"

# p string
# print_in_box(string, 'truncate')
# print_in_box(string, 'wrap')
# p string


### 4.2 WHAT'S MY BONUS?
# def calculate_bonus(salary, eligible_for_bonus)
#   eligible_for_bonus ? (salary / 2.0) : 0
# end

# p calculate_bonus(2800, true) == 1400
# p calculate_bonus(1000, false) == 0
# p calculate_bonus(50000, true) == 25000

### 3.2 STRINGY STRINGS
# def stringy(length)
#   (1..length).map {|num| num.odd? ? '1' : '0' }.join
# end

# def stringy(length, start_number = 1)
#   (1..length).map { |num| num.odd? ? start_number : 1 - start_number }.join
# end

# def stringy(length, start_number = 1)
#   pattern = [start_number, 1 - start_number]
#   pattern.cycle.first(length).join
# end


# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# puts
# puts stringy(6, 1) == '101010'
# puts stringy(9, 1) == '101010101'
# puts stringy(4, 1) == '1010'
# puts stringy(7, 1) == '1010101'
# puts
# puts stringy(6, 0) == '010101'
# puts stringy(9, 0) == '010101010'
# puts stringy(4, 0) == '0101'
# puts stringy(7, 0) == '0101010'

### 2.2 ODD
# def is_odd?(number)
#   number % 2 == 1
# end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true


### 1.2 REPEAT YOURSELF
# def repeat(string, reps)
#   1.upto(reps) {puts string}
#   # reps.times { puts string }
# end

# repeat('Hello', 3)

### 9 GET MIDDLE CHARACTER
# def center_of(string)
#   return string if string.length <= 2
#   midpoint = (string.length / 2)
#   string.length.odd? ? string[midpoint] : string[midpoint - 1, 2]
# end

# def center_of(string)
#   array = string.size.divmod(2)
#   string[(array[0] + array[1] - 1)..array[0]]
# end

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'

### 8 REVERSE THE DIGITS
# def reversed_number(num)
#   num.digits.join.to_i
# end

# def reversed_number(num)
#   array = num.digits
#   reversed_string = ""
#   array.each do |digit|
#     reversed_string << digit.to_s
#   end
#   reversed_string.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

### 7 MADLIBS
# def get_words
#   categories = ['noun', 'verb', 'adjective', 'adverb']
#   words = {}
#   categories.each do |word|
#     article = ("aeiou".include?(word[0])) ? 'an' : 'a'
#     print "Enter #{article} #{word}: "
#     words[word.to_sym] = gets.chomp
#   end
#   words
# end

# def print_story
#   words = get_words
#   puts "Do you #{words[:verb]} your #{words[:adjective]} #{words[:noun]} #{words[:adverb]}? That's hilarious!"
# end

# print_story

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

# def triangle(size, right_angle)
#   start = (right_angle[0] == 'b') ? 1 : size
#   increment = (right_angle[0] == 'b') ? 1 : -1
#   stop = (right_angle[0] == 'b') ? (size + 1) : 0
  
#   until start == stop
#     stars = '*' * start
#     puts right_angle[1] == 'l' ? stars : stars.rjust(size)
#     start += increment
#   end
# end

# triangle(5, 'tl')
# triangle(5, 'tr')
# triangle(5, 'bl')
# triangle(5, 'br')

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
