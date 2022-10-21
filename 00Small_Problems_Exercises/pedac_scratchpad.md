# PROBLEM
- Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

*INPUT*: integer, boolean
*OUTPUT*: integer (float?)

**Rules/Requirements**
- input integer will be positive
- input integer represents salary
- boolean represents whether bonus was earned
- output integer (float?) represents bonus amount

# EXAMPLES
calculate_bonus(2800, true) == 1400
calculate_bonus(1000, false) == 0
calculate_bonus(50000, true) == 25000

# DATA STRUCTURE(S)
- integer
- boolean

# ALGORITHM
1. If boolean is false, return 0
2. If boolean is true, return salary / 2

