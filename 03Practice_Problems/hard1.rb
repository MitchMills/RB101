system('clear')

# QUESTION 4

def is_an_ip_number?(word)
  word.to_i.between?(0, 255)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.size == 4

  dot_separated_words.each do |word|
   if is_an_ip_number?(word)
    next
   else
    return false
   end

  end

  return true
end

puts dot_separated_ip_address?("1.2.3.4")
puts dot_separated_ip_address?("266.300.2.4")
puts dot_separated_ip_address?("1.2.3")

# QUESTION 3

# C)
# def mess_with_vars(one, two, three)
#   one.gsub!('one', 'two')
#   two.gsub!('two', 'three')
#   three.gsub!('three', 'one')
# end
#
# one = 'one'
# two = 'two'
# three = 'three'
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# B)
# def mess_with_vars(one, two, three)
#   one = 'two'
#   two = 'three'
#   three = 'one'
# end
#
# one = 'one'
# two = 'two'
# three = 'three'
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# A)
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end
#
# one = 'one'
# two = 'two'
# three = 'three'
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# QUESTION 2
# greetings = { a: 'hi' }
#
# informal_greeting = greetings[:a]
# informal_greeting << ' there'
#
# puts informal_greeting
# puts greetings

# QUESTION 1
# if false
#   greeting = 'hello world'
# else
#   greeting = 'goodbye'
# end
#
# p greeting
