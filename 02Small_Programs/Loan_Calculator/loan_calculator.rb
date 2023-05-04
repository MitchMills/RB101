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
  annual_percentage_rate = get_apr()
  loan_duration_years = get_loan_duration()

  user_data = [loan_amount, mpr, loan_duration_months]
end

def get_loan_amount
  prompt('loan_amount?')
  loan_amount
end

def get_apr
  prompt('apr?')
  apr
end

def get_loan_duration
  prompt('loan_duration?')
  loan_duration_years
end




# MAIN PROGRAM LOOP

system 'clear'
prompt('welcome')
name = get_name
prompt('get_started', data: name)

intro
user_data = get_user_data
results = get_results(user_data)
display_results(results)
