
require 'yaml'
MESSAGES = YAML.load_file('calculator2_messages.yml')

def prompt(message, action = "puts")
  if action == "print"
    print "=> #{message}"
  else
    puts "=> #{message}"
  end
end

def get_name
  loop do
    prompt(MESSAGES['get_name'], 'print')
    name = gets.chomp
    return name unless name.empty?
    prompt(MESSAGES['name_error']) 
  end
end

def valid_number?(num)
  num.to_i.to_s == num
end

def get_number(order)
  loop do
    prompt(MESSAGES['enter_number'], 'print')
    print "#{order} number: "
    number = gets.chomp
    return number if valid_number?(number)
    prompt(MESSAGES['number_error']) 
  end
end

def get_numbers
  num1 = get_number("first")
  num2 = get_number("second")
  [num1, num2]
end

def operation_to_operator(operation)
  case operation
  when 'a' then '+'
  when 's' then '-'
  when 'm' then '*'
  when 'd' then '/'
  end
end

def get_operator
  prompt(MESSAGES['enter_operator'])
  loop do
    operation = gets.chomp
    operator =  operation_to_operator(operation)
    return operator if %w(a s m d).include?(operation)
    prompt(MESSAGES['operation_error'])
  end
end

def get_result(numbers, operator)
  if operator == '/'
    if numbers[1] == '0'
      "unable to divide by 0"
    else
      numbers.map(&:to_f).reduce(operator.to_sym)
    end
  else
    numbers.map(&:to_i).reduce(operator.to_sym)
  end
end

def display_result(numbers, operator)
  result = get_result(numbers, operator)
  prompt("#{numbers[0]} #{operator} #{numbers[1]} = #{result}")
end

def another?
  prompt(MESSAGES['another'])
  prompt(MESSAGES['another_entry'], 'print')
  reply = gets.chomp.downcase
  reply == 'y'
end

# Main program loop
system 'clear'
prompt(MESSAGES['welcome'])
name = get_name
prompt(MESSAGES['get_started'], 'print')
puts("#{name}.")

loop do
  puts
  numbers = get_numbers
  operator = get_operator
  display_result(numbers, operator)
  puts
  break unless another?
end

puts
prompt(MESSAGES['thanks'], 'print')
puts "#{name}!"
