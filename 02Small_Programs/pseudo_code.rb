# def merge(arr1, arr2)
#   index = 0
#   result = []
#   loop do
#     result << arr1[index]
#     result << arr2[index]
#     index += 1
#     break if index == arr1.size
#   end
#   result
# end

def merge(arr1, arr2)
  arr1.each_index.with_object([]) do |idx, result|
    result << arr1[idx]
    result << arr2[idx]
  end
end

p merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

=begin ####################
a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. You may assume that both array arguments have the same number of elements.

merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

input: two arrays
output: new array

- set index = 0
- set new_array = []
- add element at arr1[index] to new_array
- add element at arr2[index] to new_array
- repeat until index = size of arr1
- return new_array

=end ######################

# def third_index(string, target)
#   occurences = 0
#   index = 0
#   loop do
#     if string[index] == target
#       occurences += 1
#     end
#     return index if occurences == 3
#     index += 1
#     break if index == string.size
#   end
#   nil
# end

# def third_index(string, target)
#   occurences = 0
#   string.each_char.with_index do |char, idx|
#     occurences += 1 if char == target
#     return idx if occurences == 3
#   end
#   nil
# end

# p third_index('axbxcdxex', 'x')
# p third_index('axbxcdxexb', 'b')

=begin ####################
a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

input: string, given character
output: integer

- output integer is the index of the 3rd occurence of the given character in the string
- if the given character does not occur at least 3 times, return nil

- set `index` = 0
- set `occurences` = 0
- iterate over the input string
  - if the character at string[index] equals the given character
    - increase `occurences` + 1
  - if `occurences` = three, return `index`
  - increase `index` + 1
- if the end of the string is reached and `occurences` < 3, return `nil`


=end ######################

# def every_other(array)
#   index = 0
#   new_array = []
#   loop do
#     new_array << array[index]
#     index += 2
#     break if index >= array.size
#   end
#   new_array
# end

# def every_other(array)
#   array.each_index.with_object([]) do |idx, new_array|
#     new_array << array[idx] unless idx.odd?
#   end
# end


# p every_other([1,4,7,2,5]) # => [1,7,5]
# p every_other([1,4,7,2,5,9]) # => [1,7,5]

=begin ####################
- a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element.

input: array
output: new array

- set `new_array` as an empty array
- set `index` = `0`
- iterate over the input array
  - put the element at the index into `new_array`
  - add two to `index`
  - break when the end of the array is reached
- return the new array

=end ######################


# def long_string(array)
#    result = ''
#    array.each { |string| result << string }
#    result
# end

# array = %w(the quick brown fox)
# p long_string(array)

=begin ####################
- a method that takes an array of strings, and returns a string that is all those strings concatenated together 

input: array
output: string

- set `result` as an empty string
- iterate over the input array
  - for each string in the array, add it to `result`
- return `result`

=end ######################

# def get_num(order)
#   print "Enter #{order} number: "
#   number = gets.chomp.to_i
# end

# def get_sum(num1, num2)
#   num1 + num2
# end

# def display_sum(num1, num2)
#   result = get_sum(num1, num2)
#   puts "#{num1} + #{num2} = #{result}" 
# end

# def add_two_numbers
#   num1 = get_num("first")
#   num2 = get_num("second")
#   display_sum(num1, num2)
# end

# add_two_numbers

=begin ####################
- a method that returns the sum of two integers 
input: two integers
output: integer

- prompt user for first number
  - set `num1` to user input converted to integer
- prompt user for second number
  - set `num2` to user input converted to integer
- set `result` to `num1` plus `num2`
- return result
=end