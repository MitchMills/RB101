# PROBLEM
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use `String#squeeze` or `String#squeeze!`.

  Input: string
  Output: string

  ## Rules
  ### explicit
  - input is a string
  - output is a new string
    - all consecutive duplicate characters in input string are collapsed into a single character
  - may not use `String#squeeze` or `String#squeeze!`
  ### implicit
  - if input string is empty, return an empty string
  - to count as duplicates, characters must be consecutive
  - any number of consecutive duplicate characters should be collapsed into a single character

  ## Questions
  - does case matter? Assumption: yes (i.e. 'Aa' => 'Aa')

# EXAMPLES
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# DATA STRUCTURES


# ALGORITHM
- initialize an empty string `new_string`
- iterate over the input string
- if current character is not the same as the last character of `new_string`, add it to `new_string`
- return `new string`


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
