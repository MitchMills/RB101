# PROBLEM
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

  Input: string
    - contains words separated by exactly one space
    - a "word" is any substring of non-space characters
  Output: array
    - should contain each word in string, plus a space and the word length
    - number of words in input string == number of elements in output array
    - if the input string is empty, return an empty array
  ## Rules
  ### explicit
  
  ### implicit


  ## Questions


# EXAMPLES
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

# DATA STRUCTURES


# ALGORITHM
- split the string into an array of individual words: `words`
- iterate over `words`
  - on each iteration, return the word plus a space plus the word length
  - put the return value of each iteration in a new array
- return the new array


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
