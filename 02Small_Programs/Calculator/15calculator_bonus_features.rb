require 'yaml'
MESSAGES = YAML.load_file('15calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def valid_number?(input)
  input.to_i.to_s == input # doesn't handle "00"
  # /^-?\d+$/.match(input) # regex
  # Integer(input) rescue false # built-in conversion, code smell
end

# How to account for inputs that include decimals:
# def valid_number?(input)
#   integer?(input) || float?(input)
# end

# def integer?(input)
#   input.to_i.to_s == input # doesn't handle "00"
#   # /^-?\d+$/.match(input) # regex
#   # Integer(input) rescue false # built-in conversion, code smell
# end

# def float?(input)
#   input.to_f.to_s == input # doesn't handle "1."
#   # /\d/.match(input) && /^-?\d*\.?\d*$/.match(input) # regex, doesn't handle "."
#   # Float(input) rescue false # built-in conversion, code smell
# end

def operation_text(operator)
  word =  case operator
          when '1'
            'plus'
          when '2'
            'minus'
          when '3'
            'times'
          when '4'
            'divided by'
          end
  x = "foo" # later addition to code
  word
end


prompt('welcome')

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

puts "=> Hi, #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt('first_number')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  puts "=> #{number1} #{operation_text(operator)} #{number2} equals #{result}."

  prompt('again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')
