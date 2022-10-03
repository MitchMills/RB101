def create_row(row_length, start_integer)
  current_row = []
  current_integer = start_integer

  loop do
    current_row << current_integer
    break if current_row.length == row_length
    current_integer += 2
  end

  current_row
end

# TESTS: create_row
# row length: 1, starting integer: 2 --> `[2]`
# row length: 2, starting integer: 4 --> `[4, 6]`
# row length: 3, starting integer: 8 --> `[8, 10, 12]`
# row length: 4, starting integer: 14 --> `[14, 16, 18, 20]`

# p create_row(1, 2) == [2]
# p create_row(2, 4) == [4, 6]
# p create_row(3, 8) == [8, 10, 12]
# p create_row(4, 14) == [14, 16, 18, 20]


def create_sequence(row_number)
  all_rows = []
  row_length = 1
  start_integer = 2

  loop do
    current_row = create_row(row_length, start_integer)
    all_rows << current_row
    break if all_rows.length == row_number
    row_length += 1
    start_integer = current_row.last + 2
  end
  
  all_rows
end

#TESTS: create_sequence
# row number: 1 --> sum of integers: 2
# row number: 2 --> sum of integers: 10
# row number: 3 --> sum of integers: 30
# row number: 4 --> sum of integers: 68

# p create_sequence(1) == [[2]]
# p create_sequence(2) == [[2], [4, 6]]
# p create_sequence(3) == [[2], [4, 6], [8, 10, 12]]
# p create_sequence(4) == [[2], [4, 6], [8, 10, 12], [14, 16, 18, 20]]


def sum_last_row(all_rows)
  sum = all_rows.last.sum
end

# TESTS: sum_last_row
# p sum_last_row([[2], [4, 6], [8, 10, 12]])


def sum_even_rows(row_number)
  all_rows = create_sequence(row_number)
  sum = sum_last_row(all_rows)
end

p sum_even_rows(1) == 2
p sum_even_rows(2) == 10
p sum_even_rows(3) == 30
p sum_even_rows(4) == 68
