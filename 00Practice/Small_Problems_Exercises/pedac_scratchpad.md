# PROBLEM
Write a method that will take a short line of text, and print it within a box.
You may assume that the input will always fit in your terminal window.

  Input: string

  Output: 5 or more strings

  ## Rules
  ### explicit
  
  ### implicit


  ## Questions


# EXAMPLES
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
# DATA STRUCTURES
characters: 1..80
indexes:    0..79
spacing: 4
ellipses: 3
79 - 4 - 3 = 72
1 2| 3 4 5 |6 7 8 |9 10
     0 1 2  3 4 5

# ALGORITHM
- If string length is less than 73 characters,
  - print as usual
- If string length is greater than 73 characters
  - find all spaces in the string, and store their indexes

  - if action is to TRUNCATE:
    - find the last space index that is less than 73
    - print the string up to that index plus "..."
  - if action is to WRAP:
    - find the last space index that is less than 76
    - print the string up to that word
    - repeat with remainder as many times as necessary




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
