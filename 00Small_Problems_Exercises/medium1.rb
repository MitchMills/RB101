### ROTATION I
# def rotate_array(array)
#   array.each_index.map do |idx|
#     array[(idx == array.size - 1) ? 0 : idx + 1]
#   end
# end

# def rotate_array(array)
#   array.empty? ? [] : array[1..] << array[0]
# end

# def rotate_array(array)
#   (array.drop(1) << array[0]).compact
# end

def rotate_array(arr) # Samuel Chan
  arr.map.with_index do |element, index|
    arr[index - (arr.size - 1)]
  end
end


p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
