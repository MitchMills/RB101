# PROBLEM
Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise

  Input: string
  
  Output: array
  - contains all substrings of input string
  - should be ordered by starting character / index (i.e. all substrings that start at position 0 should come first, and so on)
    - substrings starting at a given character / index should be sorted according length, shortest to longest

  ## Rules
  ### explicit
  
  ### implicit
  - treat all characters the same
  - for index 0, there will be string.size substrings
    - for index 1, there will be string.size - 1 substrings
    - etc
  - for any given start_index, there will be (string.size - start_index) substrings
    - the longest substring of that set will have a size of (string.size - start_index )

  ## Questions


# EXAMPLES
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# DATA STRUCTURES


# ALGORITHM
- iterate
  - feed input string into leading_substrings
    - store return values in a holding array
  - remove a letter from the front of the input string
  - continue until substring size == 1
- return array of all return values
  


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
