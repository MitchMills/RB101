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



def display_summary(user_data)
  summary_info = get_summary_info(user_data)
  prompt('summary', data: user_data[:name])
  display_stats(summary_info)
end

def get_summary_info(user_data)
  summary_info = {}
  years, months = (user_data[:loan_months]).divmod(MONTHS_PER_YEAR)
  
  summary_info["Loan Amount"] = format_currency(user_data[:loan_amount])
  summary_info["APR"] = sprintf('%.2f %%', user_data[:monthly_rate] * 100 * 
    MONTHS_PER_YEAR)
  summary_info["Loan Duration"] = "#{years} years" +
    (months == 0 ? "" : " and #{months} months")
  summary_info
end

def display_stats(stats)
  stats.each do |label, value|
    prompt(label, data: value)
  end
end



def display_repayment_info(user_data)
  repayment_info = get_repayment_info(user_data)
  format_repayment_info(repayment_info)
  prompt('results')
  display_stats(repayment_info)
end

def get_repayment_info(user_data)
  repayment_info = {}
  repayment_info["Monthly Payment"] = calculate_monthly_payment(user_data)
  repayment_info["Number of Payments"] = user_data[:loan_months]
  repayment_info["Total Payment"] = repayment_info["Monthly Payment"] * 
    repayment_info["Number of Payments"]
  repayment_info["Interest Charged"] = repayment_info["Total Payment"] - 
    user_data[:loan_amount]
  repayment_info
end

def format_repayment_info(repayment_info)
  repayment_info.map do |label, value|
    value = format_currency(value) if value.is_a?(Float)
  end

  # format_currency(repayment_info["Monthly Payment"])
  # format_currency(repayment_info["Total Payment"])
  # format_currency(repayment_info["Interest Charged"])
end

def calculate_monthly_payment(user_data)
  user_data[:loan_amount] * 
    (user_data[:monthly_rate] / 
    (1 - (1 + user_data[:monthly_rate])**
    (-user_data[:loan_months])))
end




user_data = {
  :name=>"Mitch", 
  :loan_amount=>10000.0, 
  :monthly_rate=>0.005833333333333334, 
  :loan_months=>120
}

# sum_info = {
#   "Loan Amount"=>"$10,000", 
#   "APR"=>"7.00 %", 
#   "Loan Duration"=>"10 years"
# }

repay_info = {
  "Monthly Payment"=>116.10847921862376, 
  "Number of Payments"=>120, 
  "Total Payment"=>13933.01750623485, 
  "Interest Charged"=>3933.01750623485
}

format_repayment_info(repay_info)
p repay_info

=begin
=> Okay Mitch, given this loan information:

=> LOAN INFORMATION
=>   Loan Amount: $10,000
=>   APR: 7.00 %
=>   Loan Duration: 10 years
=end
