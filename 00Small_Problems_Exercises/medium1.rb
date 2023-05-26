### ROTATION I
# initial solution
def rotate_array(array)
  array.each_index.map { |idx| array[(idx == array.size - 1) ? 0 : idx + 1] }
end

# basically the LS solution modified to handle empty arrays
def rotate_array(array)
  array.empty? ? array : array[1..] << array[0]
end

def rotate_array(array) # similar approach to initial solution
  array.each_index.with_object(Array.new(array.size)) do |idx, result|
    result[idx - 1] = array[idx]
  end
end

def rotate_array(array) # also similar, but with negative indexing instead
  array.each_index.map { |idx| array[idx - (array.size - 1)] }
end

def rotate_array(array)
  array.drop(1) + array.take(1)
end

def rotate_array(array) # using modulo to get target indexes
  new_indexes = (1..array.size).map { |num| num % array.size }
  new_indexes.map { |idx| array[idx] }
end

def rotate_array(array) # one-line version of above
  (1..array.size).map { |num| num % array.size }.map { |idx| array[idx] }
end

def rotate_array(array) # same concept as above but more concise
  array.each_index.map { |idx| array[(idx+1) % array.size] }
end

def rotate_array(array)
  first, *rest = array # if array is empty, first will equal nil
  first ? rest << first : []
end

p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

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
