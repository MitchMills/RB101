# PROBLEM
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

  Input: string
  Output: hash

  ## Rules
  ### explicit
  - output hash contains three key/value pairs: lowercase, uppercase, neither
    - neither includes non-alphabetic characters AND spaces
  - if input is an empty string, values for all three keys is 0
  ### implicit


  ## Questions


# EXAMPLES
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# DATA STRUCTURES


# ALGORITHM
- initialize a hash `result` with three keys each set to 0
- iterate over each character in the string
  - determine if it is lowercase, uppercase, or neither
    - see if it is included in a list of all lowercase letters
      - if so increment `lowercase` count by 1
    - if not, see if it is included in a list of all uppercase letters
      - if so increment `uppercase` count by 1
    - if not, increment `neither` count by 1
- return `result`


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
