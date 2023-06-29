require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')
LANGUAGE = 'en'

MONTHS_PER_YEAR = 12

# GENERAL USE METHODS
def blank_line(lines = 1)
  lines.times { puts }
end

def prompt(key = 'no_message', action: 'puts', data: '', lang: LANGUAGE)
  message = format(MESSAGES[lang][key], data: data)
  action == 'print' ? print("=> #{message}") : puts("=> #{message}")
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
def welcome_user(user_data)
  prompt('welcome')
  user_data[:name] = get_name()
  blank_line
  prompt('get_started', data: user_data[:name])
end

def get_name
  loop do
    prompt('enter_name', action: 'print')
    name = gets.chomp
    return name unless name.empty?
    blank_line
    prompt('name_error')
  end
end

def display_intro(user_data)
  blank_line
  prompt('intro')
  prompt('needed_info')
  blank_line
  prompt('ready?', data: user_data[:name])
  gets
end


# USER INPUT METHODS
def get_user_inputs(user_data)
  user_data[:loan_amount] = get_loan_amount(user_data)
  user_data[:monthly_rate] = get_loan_rate(user_data)
  user_data[:loan_months] = get_loan_duration(user_data)
end


# Loan Amount Methods
def get_loan_amount(user_data)
  system 'clear'
  prompt('loan_amount_instructions')
  blank_line
  
  loop do
    amount_input = get_amount_input(user_data)
    loan_amount = amount_input.to_f
    
    confirmation = confirm_loan_amount(loan_amount)
    return loan_amount if confirmation == 'y'

    blank_line
    prompt('try_again', data: user_data[:name])
  end
end

def get_amount_input(user_data)
  loop do
    prompt('loan_amount?', action: 'print')
    amount_input = gets.chomp
    return amount_input if valid_number?(amount_input)

    blank_line
    prompt('invalid_number', data: user_data[:name])
  end
end

def confirm_loan_amount(loan_amount)
  blank_line
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
  system 'clear'
  prompt('loan_amount', data: format_currency(user_data[:loan_amount]))
  blank_line
  prompt('loan_rate_instructions')
  blank_line

  loop do
    rate_input = get_rate_input(user_data)
    annual_percentage_rate = rate_input.to_f
    
    confirmation = confirm_loan_rate(annual_percentage_rate)
    monthly_rate = (annual_percentage_rate / 100) / MONTHS_PER_YEAR
    return monthly_rate if confirmation == 'y'

    blank_line
    prompt('try_again', data: user_data[:name])
  end
end

def get_rate_input(user_data)
  loop do
    prompt('loan_rate?', action: 'print')
    rate_input = gets.chomp
    return rate_input if valid_number?(rate_input)

    blank_line
    prompt('invalid_number', data: user_data[:name])
  end
end

def confirm_loan_rate(rate)
  blank_line
  formatted_rate = sprintf('%.2f %%', rate) #######
  prompt('loan_rate_correct?', data: formatted_rate)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end


# Loan Duration Methods
def get_loan_duration(user_data)
  system 'clear'
  prompt('loan_amount', data: format_currency(user_data[:loan_amount]))
  apr = sprintf('%.2f %%', user_data[:monthly_rate] * 100 * MONTHS_PER_YEAR)
  prompt('loan_rate', data: apr)
  blank_line
  
  prompt('loan_duration_instructions')
  blank_line

  loop do
    duration_input = get_duration_input(user_data)
    loan_duration = (duration_input[0].to_i * 12) + duration_input[1].to_i
    blank_line
    confirmation = confirm_loan_duration(duration_input)
    return loan_duration if confirmation == 'y'

    blank_line
    prompt('try_again', data: user_data[:name])
    blank_line
  end

end

def get_duration_input(user_data)
  years_input = get_duration_type_input('full years', user_data)
  blank_line
  months_input = get_duration_type_input('additional months, if any', user_data)
  [years_input, months_input]
end

def get_duration_type_input(type, user_data)
  loop do
    prompt('loan_duration?', action: 'print', data: type)
    input = gets.chomp
    return input if valid_number?(input, type: 'integer')

    blank_line
    prompt('invalid_number', data: user_data[:name])
  end
end

def confirm_loan_duration(duration_input)
  formatted_loan_duration = "#{duration_input[0]} years" +
    (duration_input[1] == '0' ? "" : " and #{duration_input[1]} months")
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
  summary_info = get_summary_info(user_data)
  prompt('summary', data: user_data[:name])
  prompt('summary_loan_amount', data: summary_info[:loan_amount])
  prompt('summary_apr', data: summary_info[:apr])
  prompt('summary_loan_duration', data: summary_info[:loan_duration])
end

def get_summary_info(user_data)
  summary_info = {}
  years, months = (user_data[:loan_months]).divmod(MONTHS_PER_YEAR)
  
  summary_info[:loan_amount] = format_currency(user_data[:loan_amount])
  summary_info[:apr] = sprintf('%.2f %%', user_data[:monthly_rate] * 100 * 
    MONTHS_PER_YEAR)
  summary_info[:loan_duration] = "#{years} years" +
    (months == 0 ? "" : " and #{months} months")
  summary_info
end

def display_repayment_info(user_data)
  repayment_info = get_repayment_info(user_data)
  prompt('results')
  prompt('monthly_payment', data: format_currency(repayment_info[:monthly_payment]))
  prompt('number_of_payments', data: repayment_info[:number_of_payments])
  prompt('total_payment', data: format_currency(repayment_info[:total_payment]))
  prompt('interest_charged', data: format_currency(repayment_info[:interest_charged]))
end

def get_repayment_info(user_data)
  repayment_info = {}
  repayment_info[:monthly_payment] = calculate_monthly_payment(user_data)
  repayment_info[:number_of_payments] = user_data[:loan_months]
  repayment_info[:total_payment] = repayment_info[:monthly_payment] * 
    repayment_info[:number_of_payments]
  repayment_info[:interest_charged] = repayment_info[:total_payment] - 
    user_data[:loan_amount]
  repayment_info
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
user_data = {}
#     name: '', # string
#     loan_amount: 0, # float
#     monthly_rate: 0, # float: monthly rate decimal: 5.40 % APR --> 0.0045000000000000005
#     loan_months: 0 # integer: months
#   }

# user_data[:loan_months] = get_loan_duration(user_data)
# p user_data


welcome_user(user_data)
display_intro(user_data)
loop do
  get_user_inputs(user_data)
  display_results(user_data)
  break unless continue?(user_data)
end
blank_line
prompt('goodbye', data: user_data[:name])
