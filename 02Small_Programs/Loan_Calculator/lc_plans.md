- Get three pieces of information from user:
  - the loan amount `loan_amount`
  - the Annual Percentage Rate (APR) `annual_percentage_rate`
  - the loan duration `loan_duration_years`

- From the above, you'll need to calculate the following things:
  - monthly interest rate `monthly_interest_rate`
  - loan duration in months `loan_duration_months`
  - monthly payment `monthly_payment`

`monthly_payment = `
`loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))`

# main program loop:
- welcome
- get name

- get user data
  - get loan amount
  - get annual percentage rate
  - get loan duration

- display results

- again?
