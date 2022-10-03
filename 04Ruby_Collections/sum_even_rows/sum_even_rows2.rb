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
# p create_row(1, 2) == [2]
# p create_row(2, 4) == [4, 6]
# p create_row(3, 8) == [8, 10, 12]
# p create_row(4, 14) == [14, 16, 18, 20]


def get_last_row(row_number)
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
  
  all_rows.last
end

#TESTS: get_last_row
# p get_last_row(1) == [[2]]
# p get_last_row(2) == [[2], [4, 6]]
# p get_last_row(3) == [[2], [4, 6], [8, 10, 12]]
# p get_last_row(4) == [[2], [4, 6], [8, 10, 12], [14, 16, 18, 20]]


def sum_last_row(row_number)
  get_last_row(row_number).sum
end

#TESTS: sum_last_row
p sum_last_row(1) == 2
p sum_last_row(2) == 10
p sum_last_row(3) == 30
p sum_last_row(4) == 68
