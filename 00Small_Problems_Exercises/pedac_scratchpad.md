# PROBLEM
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

  Input: integer > 0 (positive integer)
  Output: sum or product of all integers between 1 and input integer

  ## Rules
  ### explicit
  - input integer will be positive
  - user input determines whether to output sum or product
  ### implicit


  ## Questions


# EXAMPLES
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

# DATA STRUCTURES


# ALGORITHM
- prompt input from user (positive integer): `number`
- prompt choice of sum or product: `choice`

- initialize a variable: `result = 1`
- initialize a range: `range = (2..number)`

- if `choice` is sum
  - add up all numbers between 1 and `number`
    - iterate over `range`, add each element to `result`
- if `choice` is product
  - multiply all numbers between 2 and `number`
    - iterate over `range`, multiply `result` by each element
- return `result`

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
