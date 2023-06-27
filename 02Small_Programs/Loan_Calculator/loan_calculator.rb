require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')
LANGUAGE = 'en'

MONTHS_PER_YEAR = 12

def blank_line(lines = 1)
  lines.times { puts }
end

def prompt(key, action: 'puts', data: '', lang: LANGUAGE)
  message = format(MESSAGES[lang][key], data: data)
  if action == "print"
    print "=> #{message}"
  else
    puts "=> #{message}"
  end
end

# INPUT VALIDATION METHODS
def valid_integer?(input)
  (input.to_i.to_s == input) && non_negative?(input.to_i)
end

def valid_float?(input)
  (input.to_f.to_s == input) && non_negative?(input.to_f)
end

def non_negative?(input)
  input.to_f.abs == input.to_f
end

def valid_number?(input, type: 'number')
  if type == 'integer'
    valid_integer?(input)
  elsif type == 'number'
   valid_integer?(input) || valid_float?(input)
  end
end


# INTRO METHODS
def welcome(user_data)
  prompt('welcome')
  user_data[:name] = get_name()
  prompt('get_started', data: user_data[:name])
end

def get_name
  loop do
    prompt('enter_name', action: 'print')
    name = gets.chomp
    return name unless name.empty?
    prompt('name_error')
  end
end

def intro
  blank_line
  prompt('intro')
  prompt('needed_info')
  prompt('ready?')
  gets
end


# USER INPUT METHODS
def get_user_inputs(user_data)
  system 'clear'
  user_data[:loan_amount] = get_loan_amount(user_data)
  system 'clear'
  user_data[:monthly_rate] = get_loan_rate(user_data)
  system 'clear'
  user_data[:loan_months] = get_loan_duration(user_data)
end

# Loan Amount Methods
def get_loan_amount(user_data)
  prompt('loan_amount_instructions')
  blank_line
  loop do
    amount_input = get_amount_input(user_data)
    loan_amount = amount_input.to_f
    blank_line
    confirmation = confirm_loan_amount(loan_amount)
    return loan_amount if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
    blank_line
  end
end

def get_amount_input(user_data)
  loop do
    prompt('loan_amount?', action: 'print')
    amount_input = gets.chomp
    return amount_input if valid_number?(amount_input)
    prompt('invalid_number', data: user_data[:name])
    blank_line
  end
end

def confirm_loan_amount(loan_amount)
  formatted_loan_amount = format_currency(loan_amount)
  prompt('loan_amount_correct?', data: formatted_loan_amount)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end

def format_currency(amount)
  basic = sprintf('%.2f', amount).gsub('.00','')
  with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
  final = with_commas.prepend('$')
end

# Loan Rate Methods
def get_loan_rate(user_data)
  prompt('loan_rate_instructions')
  blank_line
  loop do
    rate_input = get_rate_input(user_data)
    annual_percentage_rate = rate_input.to_f
    blank_line
    confirmation = confirm_loan_rate(annual_percentage_rate)
    monthly_rate = (annual_percentage_rate / 100) / MONTHS_PER_YEAR
    return monthly_rate if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
    blank_line
  end
end

def get_rate_input(user_data)
  loop do
    prompt('loan_rate?', action: 'print')
    rate_input = gets.chomp
    return rate_input if valid_number?(rate_input)
    prompt('invalid_number', data: user_data[:name])
    blank_line
  end
end

def confirm_loan_rate(rate)
  formatted_rate = sprintf('%.2f %%', rate) #######
  prompt('loan_rate_correct?', data: formatted_rate)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end

# Loan Duration Methods
def get_loan_duration(user_data)
  prompt('loan_duration_instructions')
  blank_line
  loop do
    duration_input = get_duration_input(user_data)
    loan_duration = (duration_input[0].to_i * 12) + duration_input[1].to_i
    blank_line
    confirmation = confirm_loan_duration(duration_input)
    return loan_duration if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
    blank_line
  end
end

def get_duration_input(user_data)
  years_input = get_input('full years', user_data)
  months_input = get_input('additional months, if any', user_data)
  [years_input, months_input]
end

def get_input(type, user_data)
  loop do
    prompt('loan_duration?', action: 'print', data: type)
    input = gets.chomp
    return input if valid_number?(input, type: 'integer')
    prompt('invalid_number', data: user_data[:name])
    blank_line
  end
end

def confirm_loan_duration(duration_input)
  formatted_loan_duration = "#{duration_input[0]} years" +
    (duration_input[1] == 0 ? "" : " and #{duration_input[1]} months.")
  prompt('loan_duration_correct?', data: formatted_loan_duration)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end

# DISPLAY RESULTS METHODS
def display_results(user_data)
  system 'clear'
  display_summary(user_data)
  blank_line
  display_repayment_info(user_data)
  blank_line
end

def display_summary(user_data)
  name = user_data[:name]
  loan_amount = format_currency(user_data[:loan_amount])
  apr = sprintf('%.2f %%', user_data[:monthly_rate] * 100 * MONTHS_PER_YEAR)
  full_years, additional_months = (user_data[:loan_months]).divmod(MONTHS_PER_YEAR)
  loan_duration = "#{full_years} years" +
    (additional_months == 0 ? "" : " and #{additional_months} months")

  summary = format(MESSAGES[LANGUAGE]['summary'], name: name, 
    loan_amount: loan_amount, apr: apr, loan_duration: loan_duration)
  puts "=> #{summary}"
end

def display_repayment_info(user_data)
  monthly_payment = calculate_monthly_payment(user_data)
  number_of_payments = user_data[:loan_months]
  total_repayed = monthly_payment * number_of_payments
  interest_paid = total_repayed - user_data[:loan_amount]

  results = format(MESSAGES[LANGUAGE]['results'],
    monthly_payment: format_currency(monthly_payment), number_of_payments: number_of_payments,
    total_repayed: format_currency(total_repayed), interest_paid: format_currency(interest_paid))
  puts "=> #{results}"
end

def calculate_monthly_payment(user_data)
  user_data[:loan_amount] * 
    (user_data[:monthly_rate] / 
    (1 - (1 + user_data[:monthly_rate])**
    (-user_data[:loan_months])))
end

# OUTRO
def continue?(user_data)
  prompt('continue?', data: user_data[:name])
  prompt('answer', action: 'print')
  answer = gets.chomp.downcase
  answer == 'y'
end



# MAIN PROGRAM LOOP
system 'clear'
user_data = {
    name: '',
    loan_amount: 0, 
    monthly_rate: 0, 
    loan_months: 0
  }
welcome(user_data)
intro()
loop do
  get_user_inputs(user_data)
  display_results(user_data)
  break unless continue?(user_data)
end
blank_line
prompt('goodbye', data: user_data[:name])
