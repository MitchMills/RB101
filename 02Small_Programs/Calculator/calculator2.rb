
require 'yaml'
MESSAGES = YAML.load_file('calculator2_messages.yml')

def prompt(key, action = 'puts', data = '')
  message = format(MESSAGES[key], data: data)
  if action == "print"
    print "=> #{message}"
  else
    puts "=> #{message}"
  end
end

def get_name
  loop do
    prompt('get_name', 'print')
    name = gets.chomp
    return name unless name.empty?
    prompt('name_error') 
  end
end

def valid_number?(num)
  num.to_i.to_s == num
end

def get_number(order)
  loop do
    prompt('enter_number', 'print', order)
    number = gets.chomp
    return number if valid_number?(number)
    prompt('number_error') 
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
  prompt('enter_operator')
  loop do
    operation = gets.chomp
    operator =  operation_to_operator(operation)
    return operator if %w(a s m d).include?(operation)
    prompt('operation_error')
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
  prompt('result', 'puts', "#{numbers[0]} #{operator} #{numbers[1]} = #{result}")
end

def another?(name)
  prompt('another', 'puts', name)
  prompt('another_entry', 'print')
  reply = gets.chomp.downcase
  reply == 'y'
end

# Main program loop
system 'clear'
prompt('welcome')
name = get_name
prompt('get_started', 'print', name)

loop do
  puts
  numbers = get_numbers
  operator = get_operator
  display_result(numbers, operator)
  puts
  break unless another?(name)
end

puts
prompt('thanks', 'puts', name)
