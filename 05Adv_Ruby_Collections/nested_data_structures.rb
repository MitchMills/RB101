a = [1, 3]
b = [2]
array1 = [a, b]

p array1
p array1.object_id
puts

p array1[0]
p array1[0].object_id
puts

p a[1].object_id
a[1] = 5
p a[1].object_id
puts

p array1
p array1.object_id
puts

p array1[0]
p array1[0].object_id




# array = [[1, 3], [2]]

# p array[0]
# p array[0].object_id
# puts

# p array[0][1]
# p array[0][1].object_id
# puts

# array[0][1] = 2
# puts

# p array[0]
# p array[0].object_id
# puts

# p array[0][1]
# p array[0][1].object_id
