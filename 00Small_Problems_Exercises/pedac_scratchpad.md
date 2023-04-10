# PROBLEM
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

  Input: array
  Output: array

  ## Rules
  ### explicit
  - input array contains numbers
  - output array contains same number of elements as input array
  - each element of output array has running total from original array
    - running total is the sum of all values in the input array up to and including the current element

  ### implicit
  - first element of output array will be the same as first element of input array
  - if input array is empty, return empty array

  ## Questions


# EXAMPLES
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

# DATA STRUCTURES


# ALGORITHM
- initialize a variable `total` and set its value to `0`
- iterate over the input array
  - for each element in the input array, add its value to `total`
  - set the corresponding element in the output array to `total`
- return output array



# # # # # # # # #
# # # # # # # # #
# # # # # # # # #

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
