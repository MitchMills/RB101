# PROBLEM
Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

  Input: string (time in 24 hour format)
  Output: integer (minutes before or after midnight)

  ## Rules
  ### explicit
  - output should be an integer in the range 0..1439
    - i.e. hours before midnight will not output a negative number
  
  ### implicit


  ## Questions


# EXAMPLES
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

# DATA STRUCTURES


# ALGORITHM
- set a variable `hours` to equal the first two characters in the input string converted to an integer
- set a variable `minutes` to equal the last two characters in the input string converted to an integer
- if hours > 23, hours = 0
- return `(hours * 60) + minutes`




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
