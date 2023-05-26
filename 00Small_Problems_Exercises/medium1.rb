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

#############
# def rotate_array(arr) # Daniel Chae
#   (arr[1..] || []) + arr[0, 1]
# end

# def rotate_integer(int) # Daniel Chae
#   ( ( digs = int.digits.reverse )[1..] + digs[0, 1] ).reduce(0) do |sum, digs|
#      sum * 10 + digs
#   end
# end
##############

###############
# def rotate_object(object)
#   case object
#   when Array, String
#     (object[1..] || object.class.new) + object[0, 1]
#   when Integer
#     (object.to_s[1..] + object.to_s[0]).to_i
#   when Hash
#     ((object.to_a[1..] || object.class.new.to_a) + object.to_a[0, 1]).to_h
#   else
#     "Unable to rotate this type of object."
#   end
# end

# def rotate_object(object)
#   case object
#   when Array, String
#     object.empty? ? object : object[1..] + object[0, 1]
#   when Integer
#     (object.to_s[1..] + object.to_s[0]).to_i
#   when Hash
#     object.empty? ? object : (object.to_a[1..] + object.to_a[0, 1]).to_h
#   else
#     "Unable to rotate this type of object."
#   end
# end

def rotate_object(object)
  sym = case object
        when Array then :to_a
        when String then :to_s
        when Integer then :to_s
        when Hash then :to_a
        else :to_s
        end
  obj = object.send(sym)
  obj.empty? ? obj : obj[1..] + obj[0, 1]
end

p rotate_object([]) == []
p rotate_object([1, 2, 3]) == [2, 3, 1]
puts
p rotate_object('') == ''
p rotate_object('123') == '231'
puts
p rotate_object(0) == 0
p rotate_object(123) == 231
puts
p rotate_object({}) == {}
p rotate_object({a: 1, b: 2, c: 3}) == {b: 2, c: 3, a: 1}
puts
p rotate_object(1.2)
############################

#########################
# def rotate_sequence(sequence) # Kelly Netterville
#   case sequence
#   when Array then return sequence[1..-1] + [sequence[0]]
#   when String then return sequence[1..-1] + sequence[0]
#   when Integer
#     rotate_sequence(sequence.to_s).to_i
#   end
# end
######################
