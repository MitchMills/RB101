# PROBLEM
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

  Input: string
  Output: integer

  ## Rules
  ### explicit
  - input will be a string of digits
    - no positive or negative signs
    - no invalid characters, i.e. all characters will be numeric
  - may not use `String#to_i`, `Integer()`, etc
  ### implicit


  ## Questions


# EXAMPLES
string_to_integer('4321') == 4321
string_to_integer('570') == 570

# DATA STRUCTURES


# ALGORITHM
- create a hash: `INTEGERS = { '0' => 0, '1' => 1, . . '9' => 9 }`
- iterate over the string
  - for each character, use it as a key to retrieve the associated value from `INTEGERS`
  - store that value in an array: `digits`
  - reverse the order of the array
- iterate over the (reversed) array `digits`
  - for each element, multiply it by 10**[index]
- return the sum of the array




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
