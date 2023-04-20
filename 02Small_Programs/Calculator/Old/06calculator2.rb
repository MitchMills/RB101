def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_text(operator)
  case operator
  when '1'
    'plus'
  when '2'
    'minus'
  when '3'
    'times'
  when '4'
    'divided by'
  end
end

prompt("Welcome to Calculator! Enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure to enter a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<~MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4.")
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

  prompt("#{number1} #{operation_text(operator)} #{number2} is #{result}.")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
