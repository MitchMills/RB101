
def sum_row(row_number)

end

# TESTS: sum_row
# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68
# p sum_row(1) == 2
# p sum_row(2) == 10
# p sum_row(4) == 68


def create_row(start_integer, row_length)
  row = []
  # steps 2 to 4
  row
end

# ALGORITHM: create_row
# 1. Create an empty array 'row' to contain the integers
# 2. Add the starting integer to the 'row' array
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 and 3 until the array has reached the correct length
#    - The correct length of the array is equal to the input integer
# 5. Return the 'row' array

# TESTS: create_row
# starting integer: 2, length: 1 --> `[2]`
# starting integer: 4, length: 2 --> `[4, 6]`
# starting integer: 8, length: 3 --> `[8, 10, 12]`
p create_row(2, 1) #== [2]
# p create_row(4, 2) #== [4, 6]
# p create_row(8, 3) #== [8, 10, 12]
