# Build a mortgage / car payment calculator that takes as input: loan amount, APR, loan duration
# Calculate: monthly interest rate, loan duration in months, monthly payment amount

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

def get_name
  loop do
    prompt('get_name')
    name = gets.chomp
    if name.empty?
      prompt('invalid_name')
    else
      return name
    end
  end
end

def welcome
  prompt('welcome')
  name = get_name
  prompt('instructions', name)
end

def welcome_back(name)
  prompt('welcome_back', name)
  prompt('instructions_again')
end

first_time? = true
def intro(first_time?)
  system 'clear'
  if first_time?
    welcome
    first_time? = false
  else
    welcome_back
  end
end

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

def get_apr
  loop do
    prompt('apr')
    apr = gets.chomp
    if valid_number?(apr)
      return apr.to_f
    else
      prompt('invalid_entry')
    end
  end
end

def calculate_mpr(apr)
  (apr / 12) / 100
end

def get_years_in_loan
  loop do
    prompt('whole_years_in_loan')
    years_in_loan = gets.chomp
    if valid_integer?(years_in_loan)
      return years_in_loan.to_i
    else
      prompt('invalid_entry')
    end
  end
end

def get_months_in_loan
  loop do
    prompt('additional_months_in_loan')
    months_in_loan = gets.chomp
    if valid_integer?(months_in_loan)
      return months_in_loan.to_i
    else
      prompt('invalid_entry')
    end
  end
end

def calculate_loan_duration_months(loan_years, loan_months)
  (loan_years * 12) + loan_months
end

def calculate_monthly_payment(loan_amount, mpr, loan_duration_months)
  loan_amount *
  (mpr /
  (1 - (1 + mpr)**(-loan_duration)))
end

def calculate_total_interest(monthly_payment, loan_duration_months, loan_amount)
  (monthly_payment * loan_duration_months) - loan_amount
end

def display_results(loan_duration_months, monthly_payment, total_interest)
  prompt('number_of_payments', loan_duration_months)
  prompt('monthly_payment', monthly_payment)
  prompt('total_interest', total_interest)
end

def another_calculation?
  loop do
    prompt('another_calculation?', name)
    answer = gets.chomp
    
  end
end


# Main Loop
loop do
  intro(first_time?)
  loan_amount = get_loan_amount
  apr = get_apr
  mpr = calculate_mpr(apr)
  years_in_loan = get_years_in_loan
  months_in_loan = get_months_in_loan
  loan_duration_months = calculate_loan_duration_months
  monthly_payment = calculate_monthly_payment
  total_interest = calculate_total_interest
  display_results  
  if another_calculation?
    break
  else
    prompt('goodbye', name)
    exit
  end
end
