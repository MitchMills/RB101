require 'yaml'
MESSAGES = YAML.load_file('16loan_calculator2_messages.yml')

def prompt(key, data = '')
  message = format(MESSAGES[key], data: data)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def non_negative?(input)
  input.to_f >= 0
end

def valid_number?(input)
  (integer?(input) || float?(input)) && non_negative?(input)
end

def valid_integer?(input)
  integer?(input) && non_negative?(input)
end

##################
YES_OR_NO = ['y', 'n', 'yes', 'no']
YES = ['y', 'yes']
NO = ['n', 'no']

def yes_or_no?(answer)
  YES_OR_NO.include?(answer)  
end

def confirm_loan_amount(loan_amount)
  loop do
    prompt('confirm_loan_amount')
    answer = gets.chomp
    if YES.include?(answer)

    elsif NO.include?(answer)

    else
      prompt()
    end

  end
end
###################

def get_loan_amount
  loop do
    prompt('loan_amount')
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      
      return loan_amount.to_f
    else
      prompt('invalid_loan_amount')
    end
  end
end