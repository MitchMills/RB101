# PROBLEM
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

  Input: array
  Output: array

  ## Rules
  ### explicit
  - input array contains integers
  - output array contains those same integers sorted alphabetically based on the English words for each number
  ### implicit


  ## Questions


# EXAMPLES
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# DATA STRUCTURES


# ALGORITHM
- from the input array, create a new array of strings, each representing the English word for the given input array integer
  - use a hash: keys = integers, values = strings
-sort the new array alphabetically
- convert that array into a new array of integers
  - use the same hash as before
- return the new array

- use the sorted array to assign and index and value to a new array
- remove any nil values
return the array



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
