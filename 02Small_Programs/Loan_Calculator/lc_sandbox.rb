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


def format_currency(amount)
  basic = sprintf('%.2f', amount).gsub('.00','')
  with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
  final = with_commas.prepend('$')
end



def display_loan_info(user_data)
  user_data.each do |label, value|
    p label
    # prompt(label.to_s, data: value)
  end
  
  # prompt(:loan_amount.to_s, data: format_currency(user_data[:loan_amount]))
end


user_data = {
  # :name=>"Mitch", 
  :loan_amount=>10000.0, 
  :monthly_rate=>0.008333333333333333, 
  :loan_months=>120
}

display_loan_info(user_data)

