# PROBLEM 4
# arr1 = [1, [2, 3], 4]
# p arr1
# arr1[1][1] = 4
# p arr1
# puts


# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# p arr2
# arr2[2] = 4
# p arr2
# puts


# hsh1 = { first: [1, 2, [3]] }
# p hsh1
# hsh1[:first][2][0] = 4
# p hsh1
# puts


# hsh2 = { ['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5 }
# p hsh2
# hsh2[['a']][:a][2] = 4
# p hsh2


# PROBLEM 3
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1_g = arr1[2][1][3]
# p arr1_g


# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2_g = arr2[1][:third][0]
# p arr2_g


# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3_g = arr3[2][:third][0][0]
# p arr3_g


# hsh1 = { 'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i'] }
# hsh1_g = hsh1['b'][1]
# p hsh1_g


# hsh2 = { first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0} }
# hsh2_g = hsh2[:third].key(0)
# p hsh2_g


# PROBLEM 2
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# sorted_by_pub_year =
# books.sort_by do |book|
#   book[:published]
# end

# puts sorted_by_pub_year


# PROBLEM 1
# arr = ['10', '11', '9', '7', '8']

# sorted = arr.sort_by {|string| string.to_i}.reverse

# sorted2 = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p sorted
# p sorted2
