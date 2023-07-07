
### 5.2 BANNERIZER
# Basic Solutioin
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

# Further Exploration
WRAP_POINT = 76 # 80 minus two characters before and two characters after for box
TRUNCATE_POINT = 73 # 76 minus three characters for ellipsis (...)

def print_in_box(string, action = 'truncate') # maybe default should be 'wrap'
  pattern = get_pattern(string, action)
  pattern.each { |line_type| print_line(string, action, line_type) }
end

def get_pattern(string, action)
  return get_wrapped_pattern(string) if action == 'wrap'
  ['line', 'side', 'text', 'side', 'line']
end

def get_wrapped_pattern(string)
  
end

def print_line(string, action, line_type)
  end_character = (line_type == 'line' ? "+" : "|")
  padding = (line_type == 'line' ? "-" : " ")
  substring = get_substring(string, action)

  middle = (line_type == 'text' ? " #{substring} " : "#{padding * (substring.size + 2)}")

  puts "#{end_character}#{middle}#{end_character}"
end

def get_substring(string, action)
  break_point = find_spaces(string, action).last
  # need to account for non-truncated lines
  return string[0...break_point] + "..." if action == 'truncate'
  
end

def wrap_line(string)
  break_point = find_spaces(string, 'wrap').last
  line = string[0...break_point]
  
end

def find_spaces(string, action)
  break_point = (action == 'truncate' ? TRUNCATE_POINT : WRAP_POINT)
  string.each_char.with_index.filter_map do |char, idx|
    idx if char == " " && idx <= break_point
  end
end

string = "the quick brown fox jumps over the lazy dog now is the time for all good men to come to the aid of their country"
p print_in_box(string)


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
#   stars = 1
#   until line > num
#     puts ("*" * stars).ljust(num)
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
#     if right_angle[1] == 'l'
#       puts '*' * start
#     else
#       puts ('*' * start).rjust(size)
#     end

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
