### ROTATION I
def rotate_array(array)
  array.each_index.map do |idx|
    array[(idx == array.size - 1) ? 0 : idx + 1]
  end
end

# def rotate_array(array)
#   array[1..] << array[0]
# end

# def rotate_array(array)
#   array.reverse.take(array.size - 1).reverse + array.take(1)
# end

# def rotate_array(arr)
#   arr_copy = arr.clone
#   arr_copy.push(arr_copy.shift)
# end

p rotate_array([1, 2, 3, 4, 5]) == [2, 3, 4, 5, 1]
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
