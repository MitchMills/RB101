# PROBLEM
Write a method that can rotate the last n digits of a number.

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

  Input: 2 integers
    - first integer (`num`): number, part of which will be rotated
    - second integer (`num_of_digits`): number of digits at the end of the number to rotate'p
      - will always be a positive integer
  Output: integer

  ## Rules
  ### explicit
  - if second input number is 1, original number will not be changed

  ### implicit


  ## Questions


# EXAMPLES
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

# DATA STRUCTURES


# ALGORITHM
- extract the last `num_of_digits` digits from `num`
  - convert `num` to an array
  - divide the array into to subarrays: last `num_of_digts` digits, remaining digits
- pass the last `num_of_digits` subarray to `rotate_object`
- take the return value from `rotate_object` and add it to the remaining digits subarray
- convert that back into an integer, and return it

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
