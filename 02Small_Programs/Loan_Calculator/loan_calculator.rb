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
  (input.to_i.to_s == input) && non_negative?(input)
end

def valid_float?(input)
  (input.to_f.to_s == input) && non_negative?(input)
end

def non_negative?(input)
  input.abs == input
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



def get_loan_amount(user_data)
  loop do
    prompt('loan_amount?', action: 'print')
    loan_amount = gets.chomp.to_f
    confirm_loan_amount(loan_amount)
    confirmation = gets.chomp.downcase
    return loan_amount if confirmation == 'y'
    prompt('try_again', data: user_data[:name])
  end
end

def confirm_loan_amount(loan_amount)
  formatted_loan_amount = sprintf('$%.2f', loan_amount)
  prompt('amount_correct?', data: formatted_loan_amount)
end

user_data = {
  name: '',
  loan_amount: 0, 
  monthly_rate: 0, 
  loan_months: 0
}

p get_loan_amount(user_data)




def get_loan_rate
  prompt('loan_rate?', action: 'print')
  annual_percentage_rate = gets.chomp.to_f
  monthly_percentage_rate = annual_percentage_rate / MONTHS_PER_YEAR
end

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
