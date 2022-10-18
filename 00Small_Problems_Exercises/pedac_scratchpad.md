# PROBLEM
- Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

INPUT: positive integer
OUTPUT: array of integers

**Rules/Requirements**
- array maintains the order of the digits in the input integer

# EXAMPLES
puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

# DATA STRUCTURE(S)
- integer
- array

# ALGORITHM
1. Iterate over the input integer
2. Put each separate digit into an array 'digits'
3. Return the array