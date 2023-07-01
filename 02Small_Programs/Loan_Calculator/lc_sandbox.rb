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




user_data = {
  :name=>"Mitch", 
  :loan_amount=>10000.0, 
  :monthly_rate=>0.008333333333333333, 
  :loan_months=>120
}