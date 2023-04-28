# PROBLEM
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use `Array#reverse` or `Array#reverse!`, nor may you use the method you wrote in the previous exercise.

  Input: array
  Output: new array

  ## Rules
  ### explicit
  - do not modify the input array
  - output array contains input array's elements in reverse order
  ### implicit
  - reverse the order of the elements in the array, not the order of any individual element
  - if input array is empty, return (new) empty array

  ## Questions


# EXAMPLES
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

# DATA STRUCTURES


# ALGORITHM
- iterate over the input array
  - start at the end of the array
    - add each element into a new array



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
