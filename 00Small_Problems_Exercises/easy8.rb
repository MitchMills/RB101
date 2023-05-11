### 3 ALL SUBSTRINGS
def substrings(string)

end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

### 2 LEADING SUBSTRINGS
# def leading_substrings(string)
#   string.chars.each_index.map { |idx| string.slice(0, idx + 1) }
# end

def leading_substrings(string)
  string.chars.each_index.map { |idx| string.slice(0..idx) }
end

def leading_substrings(string)
  (1..string.size).map { |counter| string.slice(0, counter) }
end

def leading_substrings(string)
  1.upto(string.size).map { |counter| string.slice(0, counter) }
end

def leading_substrings(string)
  (0...string.size).map { |counter| string.slice(0..counter) }
end

def leading_substrings(string)
  string.size.times.map { |counter| string.slice(0..counter) }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

### 1 SUM OF SUMS
# def sum_of_sums(array)
#   sum = 0
#   array.each_with_index do |num, idx|
#     sum += (num * (array.size - idx))
#   end
#   sum
# end

# def sum_of_sums(array)
#   array.each_with_index.with_object([]) do |(num, idx), sums|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject([]) do |sums, (num, idx)|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.map.with_index { |num, idx| num * (array.size - idx) }.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   size = 1
#   loop do
#     sum += array.take(size).sum
#     size += 1
#     break if size > array.size
#   end
#   sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.each_with_object([]) do |num, arr|
#     arr << num + sum
#     sum += num
#   end.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.map { |num| sum += num }.sum
# end

# def sum_of_sums(array)
#   array.map.with_index { |num, idx| array.take(idx + 1).sum }.sum
# end

# def sum_of_sums(array)
#   array.each_index.map { |idx| array.take(idx + 1).sum }.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject(0) do |sum, (num, idx)|
#     sum += (num * (array.size - idx))
#   end
# end

# def sum_of_sums(array)
#   array.each_index.inject(0) { |sum, idx| sum += array.take(idx + 1).sum }
# end

# p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35
