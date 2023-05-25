# PROBLEM
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

  Input: array

  Output: new array
    - contains same elements as first array but first element is at end of array
  ## Rules
  ### explicit
  
  ### implicit
  - if input array only has one element, output array will look the same

  ## Questions


# EXAMPLES
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# DATA STRUCTURES


# ALGORITHM
- iterate over the input array
  - in a new array, for each element of the input array:
    - shift the index down by 1
      - 0 => -1
      - 1 => 0
      - 2 => 1
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
