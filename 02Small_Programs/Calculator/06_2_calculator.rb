puts "Welcome to Calculator"

print "Please enter the first number: "
num1 = gets.chomp

print "Please enter the second number: "
num2 = gets.chomp

puts "Please enter the operation: a) addition, s) subtraction, m) multiplication, d) division"
operation = gets.chomp

if operation == 'a'
  operator = '+'
  result = num1.to_i + num2.to_i
elsif operation == 's'
  operator = '-'
  result = num1.to_i - num2.to_i
elsif operation == 'm'
  operator = '*'
  result = num1.to_i * num2.to_i
elsif operation == 'd'
  operator = '/'
  result = num1.to_f / num2.to_f
end

puts "#{num1} #{operator} #{num2} = #{result}"
