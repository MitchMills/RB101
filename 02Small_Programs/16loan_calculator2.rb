# Build a mortgage / car payment calculator that takes as input: loan amount, APR, loan duration
# Calculate: monthly interest rate, loan duration in months, monthly payment amount

require 'yaml'
MESSAGES = YAML.load_file('16loan_calculator_messages.yml')

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

def valid_number?(input)
  integer?(input) || float?(input)
end

# account for zero and negative inputs

def valid_name?(name)
  foo
end

name = nil
def get_name
  loop do
    prompt(:get_name)
    name = gets.chomp
    if valid_name?
      return name
    else
      prompt(:invalid_name)
    end
  end
end

def welcome
  prompt(:welcome)
  get_name
  prompt(:instructions, name)
end

def welcome_back
  prompt(:welcome_back, name)
  prompt(:instructions_again)
end

def intro
  system 'clear'
  times = 1
  if times < 2
    welcome
    times += 1
  else
    welcome_back
  end
end

loan_amount = nil
def get_loan_amount
  loop do
    prompt(:loan_amount)
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      return loan_amount
    else
      prompt(:invalid_loan_amount)
    end
  end
end

apr = nil
def get_apr
  loop do
    prompt(:apr)
    apr = gets.chomp
    if valid_number?(apr)
      return apr
    else
      prompt(:invalid_apr)
    end
  end
end

loan_years = nil
def get_loan_years
  loop do
    prompt(:loan_years)
    loan_years = gets.chomp
    if valid_number?(loan_years)
      return loan_years
    else
      prompt(:invalid_years)
    end
  end
end

loan_months = nil
def get_loan_months
  loop do
    prompt(:loan_months)
    loan_months = gets.chomp
    if valid_number?(loan_months)
      return loan_months
    else
      prompt(:invalid_months)
    end
  end
end

loan_duration = nil
def calculate_loan_duration
  loan_duration = (loan_years * 12) + loan_months
end






# loop do
#   intro
#   get_loan_amount
#   get_apr
#   get_loan_years
#   get_loan_months
#   calculate_monthly_payment
#   show_results
#   break unless another_calculation?
# end