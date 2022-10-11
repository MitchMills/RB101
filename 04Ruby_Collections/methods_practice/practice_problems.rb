# Practice Problems: Methods and More Methods

# Problem 5
hash = { a: 'ant', b: 'bear' }
shifted = hash.shift
p shifted # --> [:a, 'ant]
p hash # --> { b: 'bear' }

# Problem 4
# animals = ['ant', 'bear', 'cat']
# animal_hash = animals.each_with_object({}) do |value, hash|
#                 hash[value[0]] = value
#               end
# p animal_hash # --> { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# p animals              

# Problem 3
# numbers = [1, 2, 3]
# rejected_nums = numbers.reject do |num|
#                   puts num
#                 end
# p rejected_nums # --> [1, 2, 3]
# p numbers                

# Problem 2
# animals = ['ant', 'bat', 'caterpillar']
# short = animals.count do |str|
#           str.length < 4
#         end
# p short # --> 2
# p animals

# Problem 1
# array = [1, 2, 3]
# array.select do |num|
#   num > 5
#   'hi'
# end
# p array # --> [1, 2, 3]