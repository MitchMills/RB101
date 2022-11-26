

*PROBLEM*
Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

  Input: array of positive integers, positive integer
  Output: integer (minimal length of a contiguous subarray whose sum >= integer)

*Rules*
# Explicit:
- The method takes two arguments:
  - an array containing only positive integers: 'num_arr'
  - a positive integer: 'min_sum'
- We are looking for a set of contiguous elements in 'num_arr'
  - the sum of those elements should exceed the value of 'min_sum'
  - the output is the length of the shortest set of contiguous elements for which that is true
# Implicit:
- If the sum of all the elements in 'num_arr' is not greater than 'min_sum', return 0
- A single element of 'num_arr' can count as a set; i.e. length 1 is acceptable


*EXAMPLES*
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1 --> single element
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0 --> sum of all elements less than target

*DATA STRUCTURES*
array, sub-arrays, integer

*ALGORITHM*
- Get sum of all elements in num_arr
  - If that is less than min_sum, return 0
- Get the largest integer in num_arr
  - If that is >= min_sum, return 1
- Iterate through num_arr
  - Start at index 0
  - Start with a chunk_size of 2
    - (a chunk is a sub-array of contiguous elements, chunk_size is the length)
  - Examine each set of contiguous elements of length chunk_size
    - from index 0 till index (num_arr.size - chunk_size)
  - If the sum of that set is >= min_sum, return chunk_size
  - Break if index > num_arr.size - chunk_size
- If no result, increase the chunk_size by 1 and start again at index 0
- If chunk_size >= num_arr.size
  - return chunk_size if num_arr.sum >= min_sum
  - else return 0
  