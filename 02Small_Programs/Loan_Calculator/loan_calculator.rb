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
  user_data[:loan_amount] = get_loan_amount(user_data)
  user_data[:monthly_rate] = get_loan_rate()
  user_data[:loan_months] = get_loan_duration()
end

# Loan Amount
def get_loan_amount(user_data)
  prompt('loan_amount_instructions')
  loop do
    loan_input = get_loan_input(user_data)
    loan_amount = loan_input.to_f
    confirmation = confirm_loan_amount(loan_amount)
    return loan_amount if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
  end
end

def get_loan_input(user_data)
  loop do
    prompt('loan_amount?', action: 'print')
    loan_input = gets.chomp
    return loan_input if valid_number?(loan_input)
    prompt('invalid_number', data: user_data[:name])
  end
end

def confirm_loan_amount(loan_amount)
  formatted_loan_amount = sprintf('$%.2f', loan_amount)
  prompt('loan_amount_correct?', data: formatted_loan_amount)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end





# Loan Rate: decide precision & rounding of percentage desired
def get_loan_rate(user_data)
  prompt('loan_rate_instructions')
  loop do
    rate_input = get_rate_input(user_data)
    yearly_rate = rate_input.to_f
    confirmation = confirm_loan_rate(yearly_rate)
    return yearly_rate if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
  end
end

def get_rate_input(user_data)
  loop do
    prompt('loan_rate?', action: 'print')
    rate_input = gets.chomp
    return rate_input if valid_number?(rate_input)
    prompt('invalid_number', data: user_data[:name])
  end
end

def confirm_loan_rate(yearly_rate)
  formatted_loan_rate = sprintf('%.2f', yearly_rate) #######
  prompt('loan_rate_correct?', data: formatted_loan_rate)
  prompt('yes_or_no', action: 'print')
  confirmation = gets.chomp.downcase
end



user_data = {
  name: '',
  loan_amount: 0, 
  monthly_rate: 0, 
  loan_months: 0
}

yearly_rate = 7.4
p sprintf('%f%%', yearly_rate) ######
# p get_loan_rate(user_data)





def get_loan_duration
  prompt('loan_duration?', action: 'print')
  loan_years = gets.chomp.to_i
  loan_months = loan_years * MONTHS_PER_YEAR
end

def get_results(user_data)
  monthly_payment = 
  user_data[:loan_amount] * 
    (user_data[:monthly_rate] / 
    (1 - (1 + user_data[:monthly_rate])**
    (-user_data[:loan_months])))
end

def display_results(results)

end




# MAIN PROGRAM LOOP

# system 'clear'
# user_data = {
#     name: '',
#     loan_amount: 0, 
#     monthly_rate: 0, 
#     loan_months: 0
#   }
# welcome(user_data)
# intro()

# get_user_inputs(user_data)
# results = get_results(user_data)
# p results
# p user_data
# display_results(results)


# p get_results(user_data)
