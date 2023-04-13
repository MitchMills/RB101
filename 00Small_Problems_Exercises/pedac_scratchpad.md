# PROBLEM
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

  Input: integer
  Output: string

  ## Rules
  ### explicit
  
  ### implicit
  - if input integer is positive, output string will begin with a `+`
  - if input integer is negative, output string will begin with a `-`
  - if input ingeger is 0, output `'0'` (no sign)

  ## Questions


# EXAMPLES
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

# DATA STRUCTURES


# ALGORITHM
- if input integer is 0 return '0'
- else set a variable `positive` to `true` if positive or `false` if negative
- pass absolute value of integer to `integer_to_string`
- if `positive` is true, prepend `+`
- if `positive` is false, prepend `-`

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
