### ROTATION I
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx == array.size - 1) ? 0 : idx + 1] }
# end

# def rotate_array(array)
#   array.empty? ? [] : array[1..] << array[0]
# end

# def rotate_array(array)
#   (array.drop(1) << array[0]).compact
# end

# def rotate_array(array)
#   array.each_index.map { |idx| array[idx - (array.size - 1)] }
# end

# def rotate_array(arr) # Daniel Chae
#   (arr[1..] || []) + arr[0, 1]
# end

# def rotate_integer(int) # Daniel Chae
#   ( ( digs = int.digits.reverse )[1..] + digs[0, 1] ).reduce(0) do |sum, digs|
#      sum * 10 + digs
#   end
# end

# def rotate(input) # Joseph Liang
#   if input.class == Array
#     (input[1..-1] || []) + input[0, 1]
#   elsif input.class == String
#     (input[1..-1] || "") + input[0, 1]
#   elsif input.class == Integer
#     (input.to_s[1..-1] + input.to_s[0]).to_i
#   end
# end

# p rotate([]) == []
# p rotate([1, 2, 3]) == [2, 3, 1]
# p rotate('') == ''
# p rotate('123') == '231'
# p rotate(0) == 0
# p rotate(123) == 231

# p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
# p rotate_array([]) == []

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true
