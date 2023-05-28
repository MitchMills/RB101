### ROTATION III
def max_rotation(int)

end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

### ROTATION II
######################## vvv using helper method vvv

# def rotate_array(array)
#   array.empty? ? array : array[1..] + array[0, 1]
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   head, tail = digits.partition.with_index { |_, idx| idx < digits.size - n }
#   (head + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits[-n..]
#   (digits - tail + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits.drop(digits.size - n)
#   (digits - tail + rotate_array(tail)).join.to_i
# end

#############

# def rotate_integer(int)
#   (int.to_s[1..] + int.to_s[0, 1]).to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   num - tail + rotate_integer(tail)
# end

######################## ^^^ using helper method ^^^

######################## vvv no helper method vvv

# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse
#   (digits << digits.delete_at(-n)).join.to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   divisor = 10**(n-1)
#   rotated_tail = ((tail % divisor) * 10) + (tail / divisor)
#   num - tail + rotated_tail
# end

######################## ^^^ no helper method ^^^

########### Daniel Chae
# one-liner; no strings
# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse # [7, 3, 5, 2, 9, 1]
#   (digits << digits.delete_at(-n)).reduce(0) do |sum, digit|
#     sum * 10 + digit
#   end
# end
###########

# p rotate_rightmost_digits(735291, 0) == 735291
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(735291, 7) #== 352917

### ROTATION I
# initial solution
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx == array.size - 1) ? 0 : idx + 1] }
# end

# # basically the LS solution modified to handle empty arrays
# def rotate_array(array)
#   array.empty? ? array : array[1..] << array[0]
# end

# # similar approach as initial solution
# def rotate_array(array)
#   array.each_index.with_object(Array.new(array.size)) do |idx, result|
#     result[idx - 1] = array[idx]
#   end
# end

# # also similar, but with negative indexing instead
# def rotate_array(array)
#   array.each_index.map { |idx| array[idx - (array.size - 1)] }
# end

# # using modulo to get target indexes
# def rotate_array(array)
#   new_indexes = (1..array.size).map { |num| num % array.size }
#   new_indexes.map { |idx| array[idx] }
# end

# # same concept as above but more concise
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx+1) % array.size] }
# end

# # a couple of non-iterative solutions
# def rotate_array(array)
#   array.drop(1) + array.take(1)
# end

# def rotate_array(array)
#   first, *rest = array # if array is empty, first will equal nil
#   first ? rest << first : array
# end

# p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
# p rotate_array([]) == []

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

###################################
# def rotate_object(object)
#   case object
#   when Array, String
#     object.empty? ? object : object[1..] + object[0, 1]
#   when Hash
#     rotate_object(object.to_a).to_h
#   when Integer
#     rotate_object(object.to_s).to_i
#   else
#     "Unable to rotate this type of object."
#   end
# end

# array = [1, 2, 3]
# p rotate_object([]) == []
# p rotate_object(array) == [2, 3, 1]
# p array == [1, 2, 3]
# puts
# string = '123'
# p rotate_object('') == ''
# p rotate_object(string) == '231'
# p string == '123'
# puts
# hash = {a: 1, b: 2, c: 3}
# p rotate_object({}) == {}
# p rotate_object(hash) == {b: 2, c: 3, a: 1}
# p hash == {a: 1, b: 2, c: 3}
# puts
# integer = 123
# p rotate_object(0) == 0
# p rotate_object(integer) == 231
# p integer == 123
# puts
# p rotate_object(102) # => 21
# p rotate_object(1.2) # => "Unable to rotate this type of object."
