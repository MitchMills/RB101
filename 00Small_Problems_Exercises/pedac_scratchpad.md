# PROBLEM
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

  Input: string
  Output: new string

  ## Rules
  ### explicit
  - output string contains same values as input string except for alphabetic characters may be changed to upper or lower case
  - every other alphabetic character in output string will be uppercase, every OTHER other alphabetic character in output string will be lowercase
  - non-alphabetic characters will be included in output string
  - non-alphabetic characters are ignored when determing whether to toggle the case of alphabetic characters
  ### implicit
  - at beginning of output string, toggle is set to uppercase, then alternates with each alphabetic character
  - non-alphabetic characters do not change the toggle, only alphabetic characters

  ## Questions


# EXAMPLES
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# DATA STRUCTURES


# ALGORITHM
- create a toggle variable, set it to true
- iterate over each character in input string
- if character is not alphabetic, go to next character
- if character is alphabetic:
    - if toggle is true:
      - uppercase the letter
      - change toggle to false
    - if toggle is false:
      - lowercase the letter
      - change toggle to true
- return the new string


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
