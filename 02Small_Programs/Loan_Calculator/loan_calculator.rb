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

def valid_number?(input, type)
  true
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


def get_user_data
  loan_amount = get_loan_amount()
  monthly_rate = get_loan_rate()
  loan_months = get_loan_duration()

  user_data = {
    loan_amount: loan_amount, 
    monthly_rate: monthly_rate, 
    loan_months: loan_months
  }
end

def get_loan_amount
  prompt('loan_amount?', action: 'print')
  loan_amount = gets.chomp.to_f
end

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
  monthly_payment = user_data[:loan_amount] * (user_data[:monthly_rate] / (1 - (1 + user_data[:monthly_rate])**(-user_data[:loan_months])))
end




# MAIN PROGRAM LOOP

# system 'clear'
# prompt('welcome')
# name = get_name
# prompt('get_started', data: name)

# intro

user_data = get_user_data
# results = get_results(user_data)
# display_results(results)


p get_results(user_data)
