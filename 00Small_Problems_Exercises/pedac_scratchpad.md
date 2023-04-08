# PROBLEM
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

  Input: integer
  Output: string

  ## Rules
  ### explicit
  - input is an integer representing a year
  - output is a string representing the century
    - begins with century number
    - ends with appropriate suffix ('st', 'nd', 'rd', or 'th')
  - new centuries begin in years that end with 01
    - e.g. 1900 = 19th century, 1901 = 20th century
  
  ### implicit
  - Assume the year is AD / CE

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
- divide input integer by 100
  - if modulus == 0, then `century` = (quotient + 1)
  - else `century` = quotient
- convert `century` to a string
  - get last character to determine `suffix`
    - if '1' => 'st'
    - if '2' => 'nd'
    - if '3' => 'rd'
    - else => 'th'
- return `century` + `suffix`


# # # # # # # # #

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
