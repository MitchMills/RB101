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

YES = ['y', 'yes']
NO = ['n', 'no']

def format_loan_amount(loan_amount)
  loan_amount
end

# def format_apr(apr)
# end

# def format_loan_duration_months(loan_duration_months)
# end

def confirm_input(input)
  loop do
    prompt('confirm_input', input)
    answer = gets.chomp.downcase
    if YES.include?(answer)
      return
    elsif NO.include?(answer)
      loan_amount = get_loan_amount
      puts "c. " + loan_amount.to_s
      return
    else
      prompt('enter_yes_or_no')
    end
  end
end

def get_loan_amount
  loan_amount = ''
  formatted_loan_amount = ''
  loop do
    prompt('loan_amount')
    loan_amount = gets.chomp
    puts "a. " + loan_amount.to_s
    if valid_number?(loan_amount)
      # formatted_loan_amount = format_loan_amount(loan_amount)
      confirm_input(loan_amount)
      puts "b. " + loan_amount.to_s
      return loan_amount.to_f
    else
      prompt('invalid_loan_amount')
    end
  end
end

p get_loan_amount
