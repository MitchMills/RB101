# PROBLEM
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

  Input: integer
  Output: integer
    - if input integer is a double number, return as is
    - otherwise return input integer * 2

  ## Rules
  ### explicit
  - double numbers:
    - even number of digits
    - left side digits == right side digits
  ### implicit


  ## Questions


# EXAMPLES
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

# DATA STRUCTURES


# ALGORITHM
- determine if number is a double number
  - if odd number of digits: false => number * 2
  - else if first half == second half: true => number
    - convert to string, half = size / 2
    - if string[0, half] == [half, half]: true
  - else: false => number * 2


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
