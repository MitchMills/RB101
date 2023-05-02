def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

puts "Welcome to the Loan Payment Calculator"
puts "To figure out your monthly payment, we'll need three pieces of information:"

loan_amount = nil
loop do
  print "1. What is the loan amount? $"
  loan_amount = gets.chomp

  if valid_number?(loan_amount)
    break
  else
    puts "Please enter a valid dollar amount."
  end
end

yearly_interest_rate = nil
loop do
  print "2. What is the Annual Percentage Rate (APR)? %"
  yearly_interest_rate = gets.chomp

  if valid_number?(yearly_interest_rate)
    break
  else
    puts "Please enter a valid interest rate."
  end
end

loan_duration_years = nil
loop do
  print "3. What is the loan duration, in years? "
  loan_duration_years = gets.chomp

  if integer?(loan_duration_years)
    break
  else
    puts "Please enter a valid loan duration."
  end
end

monthly_interest_rate = (yearly_interest_rate.to_f / 12) / 100
loan_duration_months = loan_duration_years.to_i * 12

monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

puts "Your monthly payment will be $#{monthly_payment}."