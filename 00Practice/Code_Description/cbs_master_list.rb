##### CODE BLOCK SOCIAL
# JUNE 19 #
### 1
int = 7
array = [2, 4, 6]
 
array.each do |element|
  int = element
end
 
puts int

### 2
int = 6
array = [3, 2, 1]
 
array.each do |int|
  int += 1
end
 
puts int

### 3
int = 4
array = [2, 5, 9]
 
def my_value(ary)
  ary.each do |element|
    int += element
  end
end
 
my_value(array)
puts int



# June 12 #
### 1
# arr = ["b", "a"]
# arr = arr.product([Array(1..3)])
# arr.first.delete(arr.first.last)

### 2
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
#  "sheep"
# end

# p count_sheep

### 3
# def whats_my_value(value)
#   value = value.upcase!
#   value.concat('!')
# end

# s = "string"
# t = whats_my_value(s)

# p s
# p t

#############
# June 4 #
### 1
# a = 4

# loop do
#   a = 5 
#   b = 3

#   break
# end

# puts a
# puts b

### 2
# animal = "dog"

# loop do |_|
#   animal = "cat" 
#   var = "ball"
#   break
# end

# puts animal
# puts var

### 2
# array = [1, 2, 3, 4, 5]
# array.select do |num|
# 	puts num if num.odd?
# end

########## SAMPLE
# a = "hi there"
# b = a
# a = "not here"
# puts b
