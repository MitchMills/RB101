## Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

## PROBLEM
**Rules / Requirements**
- sequence of integers
- all integers are even numbers
- sequence begins with 2
- sequence increases consecutively (2, 4, 6, 8, ...)
- sequence is grouped in rows
- the 'number' of the row indicates how many integers are in that row
  - row 1 has one integer, row 2 has two integers, etc
- Input: a single integer
  - identifies a row number
- Output: a single integer
  - sum of all the integers in that row

- Sequence / Structure:
2, 4, 6, 8, 10, 12, 14, 16, 18, 20, . . .

Row 1: 2
Row 2: 4, 6
Row 3: 8, 10, 12
Row 4: 14, 16, 18, 20
....

**Questions**
- How do we create the structure?
  - Can't hardcode it; need to create it 'on the fly' after given the input integer

## EXAMPLES
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

## DATA STRUCTURES
- Overall structure represents an ordered sequence of integers
- Within that structure there are an ordered sequence of rows
- Each row contains an ordered sequence of integers

- Can use a nested array:
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ...
]
