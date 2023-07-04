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
def valid_number?(type = 'number', input)
  if type == 'integer'
    valid_integer?(input)
  elsif type == 'number'
   valid_integer?(input) || valid_float?(input)
  end
end

def valid_integer?(input)
  (input.to_i.to_s == input) && non_negative?(input.to_i)
end

def valid_float?(input)
  (input.to_f.to_s == input) && non_negative?(input.to_f)
end

def non_negative?(input)
  input.to_f.abs == input.to_f
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
# def get_user_inputs(user_data)
#   user_data[:loan_amount] = loan_amount(user_data)
#   user_data[:loan_rate] = loan_rate(user_data)
#   user_data[:loan_duration] = loan_duration(user_data)
# end

# Input Summary Methods
def display_summary(user_data)
  summary_info = get_summary_info(user_data)
  prompt('loan_information') if user_data.size > 1
  display_stats(summary_info)
  blank_line if summary_info.size > 0
end

def get_summary_info(user_data)
  summary_info = {}
  years, months = (user_data[:loan_duration].to_i).divmod(MONTHS_PER_YEAR) if
    user_data[:loan_duration]
  
  summary_info["Loan Amount"] = format_currency(user_data[:loan_amount].to_f) if 
    user_data[:loan_amount]
  summary_info["APR"] = sprintf('%.2f %%', user_data[:loan_rate].to_f * 100 * 
    MONTHS_PER_YEAR) if user_data[:loan_rate]
  summary_info["Loan Duration"] = "#{years} years" +
    (months == 0 ? "" : " and #{months} months") if user_data[:loan_duration]
  summary_info
end

def display_stats(stats)
  stats.each do |label, value|
    prompt(label, data: value)
  end
end

# DISPLAY RESULTS METHODS
def display_results(user_data)
  system 'clear'
  prompt('summary', data: user_data[:name])
  display_summary(user_data)
  blank_line
  display_repayment_info(user_data)
  blank_line
end

def display_repayment_info(user_data) ### TODO: make generic display info method
  repayment_info = get_repayment_info(user_data)
  prompt('results')
  display_stats(repayment_info)
end

def get_repayment_info(user_data)
  repayment_info = {}
  repayment_info["Monthly Payment"] = calculate_monthly_payment(user_data)
  repayment_info["Number of Payments"] = user_data[:loan_duration]
  repayment_info["Total Payment"] = repayment_info["Monthly Payment"] * 
    repayment_info["Number of Payments"]
  repayment_info["Interest Charged"] = repayment_info["Total Payment"] - 
    user_data[:loan_amount]
  format_repayment_info(repayment_info)
end

def calculate_monthly_payment(user_data)
  user_data[:loan_amount] * 
    (user_data[:loan_rate] / 
    (1 - (1 + user_data[:loan_rate])**
    (-user_data[:loan_duration])))
end

def format_repayment_info(repayment_info)
  repayment_info.each do |label, value|
    repayment_info[label] = format_currency(value) unless label == "Number of Payments"
  end
end



# OUTRO
def continue?(user_data)
  prompt('continue?', data: user_data[:name])
  prompt('answer', action: 'print')
  answer = gets.chomp.downcase
  answer == 'y'
end

def reset_loan_info(user_data)
  user_data.each do |label, value|
    user_data.delete(label) unless label == :name
  end
end


# MAIN PROGRAM LOOP
# system 'clear'
# user_data = {}

# welcome_user(user_data)
# display_intro(user_data)
# loop do
#   get_user_inputs(user_data)
#   display_results(user_data)
#   break unless continue?(user_data)
#   reset_loan_info(user_data)
# end
# blank_line
# prompt('goodbye', data: user_data[:name])





####################################
def get_user_inputs(user_data)
  user_data[:loan_amount] = loan_info('loan_amount', user_data)
  user_data[:loan_rate] = loan_info('loan_rate', user_data)
  user_data[:loan_duration] = loan_info('loan_duration', user_data)
end

def loan_info(type, user_data)
  system 'clear'
  display_summary(user_data)
  
  prompt(type + '_instructions')
  blank_line
  get_and_confirm_info(type, user_data)
end

def get_and_confirm_info(type, user_data)
  loop do
    input = get_input(type, user_data)
    blank_line
    confirmation = confirm_input(type, input)
    if confirmation == 'y'
      case type
      when 'loan_amount' then return input.to_f
      when 'loan_rate' then return convert_apr_to_monthly(input.to_f)
      when 'loan_duration' then return convert_to_months(input)
      end
    end

    blank_line
    prompt('try_again', data: user_data[:name])
  end
end

def get_input(type, user_data)
  loop do
    prompt(type + '?', action: 'print') unless type == 'loan_duration'
    input = (type == 'loan_duration' ? get_duration_input(user_data) : gets.chomp)
    return input if type == 'loan_duration' || valid_number?('number', input)

    blank_line
    prompt('invalid_number', data: user_data[:name])
  end
end


def get_duration_input(user_data)
  years_input = get_sub_duration_input('full years', user_data)
  blank_line
  months_input = get_sub_duration_input('additional months, if any', user_data)
  [years_input, months_input]
end

def get_sub_duration_input(type, user_data)
  loop do
    prompt('loan_duration?', action: 'print', data: type)
    input = gets.chomp
    return input.to_i if valid_number?('integer', input)

    blank_line
    prompt('invalid_number', data: user_data[:name])
  end
end


def confirm_input(type, input)
  prompt(type + '_correct?', data: format_input(type, input))
  prompt('yes_or_no', action: 'print')
  gets.chomp.downcase
end

def format_input(type, input)
  case type
  when 'loan_amount'
    format_currency(input)
  when 'loan_rate'
    sprintf('%.2f %%', input)
  when 'loan_duration'
    "#{input[0]} years" + (input[1] == 0 ? "" : " and 
      #{input[1]} months")
  end
end

def convert_apr_to_monthly(apr)
  apr / 100 / MONTHS_PER_YEAR
end

def convert_to_months(years_and_months)
  (years_and_months[0] * MONTHS_PER_YEAR) + years_and_months[1]
end

def format_currency(amount)
  basic = sprintf('%.2f', amount).gsub('.00','')
  with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
  final = with_commas.prepend('$')
end

user_data = {
  :name=>"Mitch", 
  # :loan_amount=>10000.0, 
  # :loan_rate=>0.008333333333333333, ####### WORK ON APR
  # :loan_duration=>120
}

get_user_inputs(user_data)
p user_data
