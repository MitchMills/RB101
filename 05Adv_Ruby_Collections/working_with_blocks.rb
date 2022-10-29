# EXAMPLE 7


# EXAMPLE 6
# array1 = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]

# array2 = 
# array1.select do |hash|
#   hash.any? do |key, value|
#     value[0] == key.to_s
#   end
# end

# p array1
# p array2
# puts
# p array1[0].object_id
# p array2[0].object_id


# EXAMPLE 5
# array1 = [[1, 2], [3, 4]]

# array2 = 
# array1.map do |arr|
#   arr.map do |num|
#     num * 2
#   end
# end

# p array1
# p array2


# EXAMPLE 4
# array1 = [[18, 7], [3, 12]]
# p array1
# puts

# my_array = 
# array1.each do |arr|
#   arr.each do |num|
#     if num > 5
#       puts num
#     end
#   end
# end
# puts

# p array1
# p my_array
# p array1.object_id
# p my_array.object_id


# EXAMPLE 3
# array1 = [[1, 2], [3, 4]]

# array2 = array1.map do |arr|
#   puts arr.first
#   arr.first
# end

# p array1
# p array2


# EXAMPLE 2
# array1 = [[1, 2], [3, 4]]

# array2 = array1.map do |arr|
#   puts arr.first
# end

# p array1
# p array2


# EXAMPLE 1
# [[1, 2], [3, 4]].each do |arr|
#   puts arr.first
# end
