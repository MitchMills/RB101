### 5 REVESED ARRAYS II
# def reverse(array)
#   new_array = []
#   index = array.length - 1
#   until index < 0
#     new_array << array[index]
#     index -= 1
#   end
#   new_array
# end

# def reverse(array)
#   index = array.length - 1
#   array.each_with_object([]) do |_, arr|
#     arr << array[index]
#     index -= 1
#   end
# end

# def reverse(array)
#   array.each_index.with_object([]) do |idx, new_array|
#     new_array << array[(array.length - 1) - idx]
#   end
# end

# def reverse(array)
#   array.reverse_each.with_object([]) do |ele, new_array|
#     new_array << ele
#   end
# end

# def reverse(array)
#   array.inject([]) do |new_array, element|
#     new_array.prepend(element)
#   end
# end

# def reverse(array)
#   array.each_with_object([]) do |element, new_array|
#     new_array.prepend(element)
#   end
# end

def reverse(arr)
  arr.inject([], :prepend)
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

### 4 REVERSED ARRAYS I
# def reverse!(array)
#   new_array = []
#   (array.size).times do
#     new_array << array.pop
#   end 
  
#   (new_array.size).times do
#     array << new_array.shift
#   end
#   array
# end

# def reverse!(array)
#   front = 0
#   back = -1
#   until front >= array.size / 2
#     array[front], array[back] = array[back], array[front]
#     front += 1
#     back -= 1
#   end
#   array
# end

# def reverse!(array)
#   left = 0
#   right = array.size - 1
#   until left > right
#     array[left], array[right] = array[right], array[left]
#     left += 1
#     right -= 1
#   end
#   array
# end

# def reverse!(arr)
#   iterations = arr.size / 2 - 1
#   for i in (0..iterations)
#     arr[i], arr[(-i)-1] = arr[(-i)-1], arr[i]
#   end
#   arr
# end

# list = [1,2,3,4,5]
# result = reverse!(list)
# p result == [5, 4, 3, 2, 1] # true
# p list == [5, 4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

### 3 FIBONACCI NUMBER LOCATION BY LENGTH
# def find_fibonacci_index_by_length(length)
#   num1, num2 = 1, 1
#   index = 3
#   loop do
#     next_num = num1 + num2
#     return index if next_num.to_s.size >= length
#     index += 1
#     num1, num2 = num2, next_num
#   end
# end

# def find_fibonacci_index_by_length(length)
#   current_pair = [1, 1]
#   index = 3
#   loop do
#     next_num = current_pair.sum
#     return index if next_num.to_s.size >= length
#     index += 1
#     current_pair[0], current_pair[1] = current_pair[1], next_num
#   end
# end

# p find_fibonacci_index_by_length(2) == 7   # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12  # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

### 2 DELETE VOWELS
# VOWELS = "aeiouAEIOU"

# def remove_vowels(string_array)
#   string_array.map { |string| string.delete(VOWELS) }
# end

# def remove_vowels(string_array)
#   string_array.map { |string| string.gsub(/[aeiou]/i, "") }
# end

# def remove_vowels(string_array)
#   string_array.map do |string| 
#     string.chars.each do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string| 
#     string.chars.map do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     new_string = "" 
#     string.each_char do |char|
#       new_string << char unless VOWELS.include?(char)
#     end
#     new_string
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.each_char.with_object("") do |char, new_string|
#       new_string << char unless VOWELS.include?(char)
#     end
#   end
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# # def dms(angle)
# #   degrees = angle
# #   minutes = (degrees % 1) * 60
# #   seconds = (minutes % 1) * 60
# #   %Q(%(#{sprintf("%d", degrees)}°#{sprintf("%02d", minutes)}'#{sprintf("%02d", seconds)}\"))
# # end

# puts dms(30) #== %(30°00'00")
# puts dms(76.73) #== %(76°43'48")
# puts dms(254.6) #== %(254°36'00")
# puts dms(93.034773) #== %(93°02'05")
# puts dms(0) #== %(0°00'00")
# puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
