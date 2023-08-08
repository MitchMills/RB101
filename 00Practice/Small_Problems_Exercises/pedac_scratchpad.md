# PROBLEM
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

  Input: integer: represents year

  Output: string: represents century

  ## Rules
  ### explicit
  - new centuries begin in years that end with 01
    - 20th century = 1901 - 2000
  ### implicit


  ## Questions


# EXAMPLES
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

# DATA STRUCTURES


# ALGORITHM
- determine century
  - get the quotient and remainder of dividing year by 100
    - if remainder == 0, century is quotient
    - if remainder > 0, century is (quotient + 1)
- display century
  1st

  2nd

  3rd
  
  4th
  5th
  6th

  21st


# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


  Input: 

  Output:

  ## Rules
  ### explicit
  
  ### implicit


  ## Questions


# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
