### 2 DOUBLE DOUBLES
# def twice(num)
#   str = num.to_s
#   half = str.size / 2
#   str[0, half] == str[half, half] && str.size.even? ? num : num * 2
# end

#############
# def is_double?(num)
#   str = num.to_s
#   half = str.size / 2
#   str.size.odd? ? false : str[0, half] == str[half, half]
# end

# def twice(num)
#   is_double?(num) ? num : num * 2
# end
##############

# def twice(num)
#   array = num.to_s.chars
#   half = array.size / 2
#   array[0, half] == array[half, half] && array.size.even? ? num : num * 2
# end

def twice(num)
  array = num.to_s.chars # ['4', '4', '4']
  half = array.size / 2 # 1
  array1, array2 = array.each_slice(half) { |char| char }
  p array1
  p array2
  # array1 == array2 ? num : num * 2
end

# def twice(integer)
#   array = integer.digits.reverse
#   array1, array2 = array.partition.with_index { |_, idx| idx < array.length / 2 }
#   array1 == array2 ? integer : integer * 2
# end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

### 1 WELCOME STRANGER
# def greetings(name, info)
#   "Hello, #{name.join(' ')}! " +
#   "Nice to have a #{info.values.join(' ')} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."
